package  
{
	import flash.display.MovieClip;
	//import flash.events.MouseEvent;
	//import Objects.tempObj;
	import Screens.*;
	import Collections.*;
	import starling.display.Image;
	import starling.events.Event;
	import starling.display.Sprite;
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.core.Starling;
	import bitmasq.Gamepad;
	import bitmasq.GamepadEvent;
	
	public class Game extends Sprite {
		
		private static const STATE_INIT:Number  = 1;
		private static const STATE_MENU:Number   = 2;
		private static const STATE_CREDITS:Number = 3;
		private static const STATE_PLAY:Number = 4;
		private static const STATE_PAUSE:Number = 5;
		private static const STATE_GAMEOVER:Number = 6;
		private static const STATE_WIN:Number = 7;
		private static const STATE_LEVELSELECT:Number = 8;
		private static const STATE_CONTROLS:Number = 9;
		
		//private var temp:tempObj;
		private var timer:Timer;
		private var state:Number;
		private var numTicks:Number;
		private var tempTicks:Number;
		private var currentScreen:screen;
		private var keyDown:Boolean;
		private var soundMenu:soundPlayer;
		private var soundPlay:soundPlayer;
		private var currentLvl:Number;
		
			
		public function Game() {
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(event:Event):void {
			
			trace("Initializing");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			Gamepad.get().addEventListener(GamepadEvent.CHANGE, onChange);
			
			//Changes the state to INIT
			state = STATE_INIT;
			numTicks = 0;	
			
			//Handles mouse presses
			this.addEventListener(TouchEvent.TOUCH, handleTouch);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			//Start ticking
			timer = new Timer(1000 / 30, 0);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			
		}
		
		
		private function tick(event:TimerEvent):void {
			
			switch(state) {
				
				case STATE_INIT:	
					
					//If the current screen has not been set or is not the loading screen, then set it to the loading screen
					if (currentScreen == null || currentScreen.getType() != "loading") {
						
						trace("Initializing.");
						this.addEventListener("initComplete", doneInit);
						
						startInit();
						
					}
				
					
					break;
					
				case STATE_MENU:
					
					//If the current screen has not been set or is not the menu
					if (currentScreen == null || currentScreen.getType() != "mainMenu") {
						this.addEventListener("levelSelect", levelSelect);
						this.addEventListener("controlsSelect", controlsSelect);
						this.addEventListener("creditSelect", creditSelect);
						currentScreen = new mainMenuScreen();
						addChild(currentScreen);
						
					}
					
					
					break;
					
				case STATE_CREDITS:
					
					if (currentScreen == null || currentScreen.getType() != "credits") {
						this.addEventListener("menuSelect", menuSelect);
						currentScreen = new creditScreen();
						addChild(currentScreen);
						
						
					}
					
					break;
					
				case STATE_CONTROLS:
					
					if (currentScreen == null || currentScreen.getType() != "controls") {
						this.addEventListener("menuSelect", menuSelect);
						currentScreen = new controlsScreen();
						addChild(currentScreen);
						
						
					}
					
					break;
					
				case STATE_PLAY:
					
					if (currentScreen == null || currentScreen.getType() != "gameScreen") {
						
						play(new Event("play", false, 1));
						
					}
					else if(currentScreen.collision) { 
						state = STATE_GAMEOVER;
						tempTicks = numTicks;
					}
					else if (currentScreen.win) {
						trace("winning");
						play(new Event("play", false, currentLvl + 1));
					}
					
					break;
					
				case STATE_PAUSE:
					
					if (currentScreen == null || currentScreen.getType() != "pause") {
						currentScreen = new pauseScreen();
						addChild(currentScreen);
					}
					
					break;
					
				case STATE_LEVELSELECT:
					
					if (currentScreen == null || currentScreen.getType() != "levelSelect") {
						this.addEventListener("menuSelect", menuSelect);
						currentScreen = new selectScreen();
						addChild(currentScreen);
						
					}
					
					break;
					
				case STATE_GAMEOVER:
					
					if (currentScreen == null || currentScreen.getType() != "gameover") {
						this.addEventListener("gameover", gameOver);
						currentScreen = new gameoverScreen();
						addChild(currentScreen);
					}
					
					break;
				
			}
				
			if (currentScreen != null) {
				currentScreen.tick();
			}
			
			numTicks++;
			
		}
		
		private function levelSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("levelSelect", levelSelect);
			
			this.addEventListener("play", play);
			
			state = STATE_LEVELSELECT;
			
		}
		private function controlsSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("controlsSelect", controlsSelect);
			
			
			state = STATE_CONTROLS;
			
		}
		
		private function creditSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("credits", creditSelect);
			
			state = STATE_CREDITS;
			
		}
		private function gameOver(ev:Event):void {
			currentScreen = null;
			removeChildren();
			removeEventListener("gameover", gameOver);
			
			state = STATE_GAMEOVER;

		}
		private function menuSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("menuSelect", menuSelect);
			
			state = STATE_MENU;
			
		}
		private function play(ev:Event):void {
			
			soundMenu.stopSound();
			currentLvl = int(ev.data);
			soundPlay = new soundPlayer();
			soundPlay.playSound("play");
			
			currentScreen = null;
			removeChildren();
			removeEventListener("play", play);
			
			state = STATE_PLAY;
			currentScreen = new gameScreen(int(ev.data));
			addChild(currentScreen);
			
		}
		private function pauseGame():void {
			state = STATE_PAUSE;
		}
		private function unPauseGame():void {
			soundPlay.stopSound();
			
			removeChild(currentScreen);
			state = STATE_PLAY;
		}
		
		//Do init things
		private function startInit():void {
			
			dispatchEvent(new Event("initComplete" , true));
			
		}
		
		private function onKeyDown(event:KeyboardEvent):void {
			
			//keycode 32 is spacebar
			switch(state)
			{
				case STATE_INIT:
					break;
				case STATE_MENU:
					break;
				case STATE_PLAY:
					if(event.keyCode == 32){
						pauseGame();
						//state = STATE_PAUSE;
					}
					else {
						currentScreen.handleKeyDown(event);
					}
					break;
				case STATE_PAUSE:
					if(event.keyCode == 32){
						unPauseGame();
						
					}
					break;
				case STATE_CREDITS:
					if (event.keyCode == 82) {
						state = STATE_MENU;
					}
					break;
				case STATE_GAMEOVER:
						if (tempTicks + 50 <= numTicks){
							soundPlay.stopSound();
							state = STATE_MENU;
							soundMenu.playSound("mainMenu");
							currentScreen = null;
						}
					break;
				case STATE_WIN:
					break;
				case STATE_CONTROLS:
					if (event.keyCode == 82) {
						state = STATE_MENU;
					}
					break;
			}
		}
		
		private function onKeyUp(event:KeyboardEvent):void{
			switch(state)
			{
				case STATE_INIT:
					keyDown == false;
					break;
				case STATE_MENU:
					keyDown = false;
					break;
				case STATE_PLAY:
					if(event.keyCode == 32){
						//do nothing
					}
					else {
						currentScreen.handleKeyUp(event);
					}
					keyDown = false;
					break;
				case STATE_PAUSE:
					keyDown = false;
					break;
				case STATE_CREDITS:
					keyDown = false;
					break;
			}
		}
		
		//Clean up after init
		private function doneInit():void {
			trace("Done initializing.");
			soundMenu = new soundPlayer();
			soundMenu.playSound("mainMenu");
			state = STATE_MENU;
			
		}
		
		//Handle mouse clicks
		public function handleTouch(event:TouchEvent):void {
			
			//If a touch event is finished
			var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
			
			if (touch) {
				
				currentScreen.handleTouch(touch);
			}
			
		}
		
				private function onChange(event:GamepadEvent):void {
			
			if (event.control == Gamepad.LT && event.value == 1) {
				onKeyDown(new KeyboardEvent("null", 0, 37));
			}else if(event.control == Gamepad.LT && event.value == 0){
				onKeyUp(new KeyboardEvent("null", 0, 37));
			}
			
			if (event.control == Gamepad.RT && event.value == 1) {
				onKeyDown(new KeyboardEvent("null", 0, 39));
			}else if(event.control == Gamepad.RT && event.value == 0){
				onKeyUp(new KeyboardEvent("null", 0, 39));
			}
			
			if (event.control == Gamepad.RSTICK_X || event.control == Gamepad.RSTICK_X) {
				
				trace("Right stick is doing shit");
				currentScreen.handleJoystick(event);
				
			}
			
		}
		
	}

}

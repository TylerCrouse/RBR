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
	
	public class Game extends Sprite {
		
		private static const STATE_INIT:Number  = 1;
		private static const STATE_MENU:Number   = 2;
		private static const STATE_CREDITS:Number = 3;
		private static const STATE_PLAY:Number = 4;
		private static const STATE_PAUSE:Number = 5;
		private static const STATE_GAMEOVER:Number = 6;
		private static const STATE_WIN:Number = 7;
		private static const STATE_LEVELSELECT:Number = 8;
		private static const STATE_SETTINGS:Number = 9;
		
		//private var temp:tempObj;
		private var timer:Timer;
		private var state:Number;
		private var numTicks:Number;
		private var currentScreen:screen;
		private var keyDown:Boolean;
		private var soundMenu:soundPlayer;
		private var soundPlay:soundPlayer;
			
		public function Game() {
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function init(event:Event):void {
			
			trace("Initializing");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
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
						//this.addEventListener("settingsSelect", settingsSelect);
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
					
				case STATE_PLAY:
					
					if (currentScreen == null || currentScreen.getType() != "gameScreen") {
						
						play(new Event("play", false, 1));
						
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
		private function settingsSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("settingsSelect", settingsSelect);
			
			//this.addEventListener("play", play);
			
			state = STATE_SETTINGS;
			
		}
		
		private function creditSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("credits", creditSelect);
			
			state = STATE_CREDITS;
			
		}
		private function menuSelect(ev:Event):void {
			
			currentScreen = null;
			removeChildren();
			removeEventListener("menuSelect", menuSelect);
			
			state = STATE_MENU;
			
		}
		private function play(ev:Event):void {
			
			soundMenu.stopSound();
			
			soundPlay = new soundPlayer();
			soundPlay.playSound("play");
			
			currentScreen = null;
			removeChildren();
			removeEventListener("play", play);
			
			state = STATE_PLAY;
			currentScreen = new gameScreen(int(ev.data));
			addChild(currentScreen);
			
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
					keyDown = true;
					removeChildren();
					state = STATE_PLAY;
					break;
				case STATE_PLAY:
					if(event.keyCode == 32){
					
						state = STATE_PAUSE;
					}
					else {
						currentScreen.handleKeyDown(event);
					}
					break;
				case STATE_PAUSE:
					if(event.keyCode == 32){
						
						
					}
					break;
				case STATE_CREDITS:
					if (event.keyCode == 82) {
						state = STATE_MENU;
					}
					break;
				case STATE_GAMEOVER:
					state = STATE_CREDITS;
					break;
				case STATE_WIN:
					state = STATE_CREDITS;
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
		
	}

}

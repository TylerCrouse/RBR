package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import Objects.tempObj;
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
		
		private var timer:Timer;
		private var state:Number;
		private var numTicks:Number;
		private var currentScreen:screen;
			
		public function Game() {
			super();
			
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(event:Event):void {
			
			trace("Initializing");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			
			//Changes the state to INIT
			state = STATE_INIT;
			numTicks = 0;	
			
			this.addEventListener(TouchEvent.TOUCH, handleTouch);
			
			//Start ticking
			timer = new Timer(1000 / 30, 0);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			
			
		}
		
		private function tick(event:TimerEvent):void {
			
			switch(state) {
				
				case STATE_INIT:	
					
					if (currentScreen == null || currentScreen.getType() != "loading") {
						
						trace("Initializing.");
						this.addEventListener("initComplete", doneInit);
						
						startInit();
						
					}
				
					
					break;
					
				case STATE_MENU:
					
					if (currentScreen == null || currentScreen.getType() != "mainMenu") {
						
						currentScreen = new tempScreen();
						addChild(currentScreen);
						
					}
					//trace("At menu.");
					
					break;
					
				case STATE_CREDITS:
					
					break;
					
				case STATE_PLAY:
					
					break;
			}
			
			numTicks++;
			
		}
		
		private function startInit():void {
			
			var temp:tempObj = new tempObj();
			addChild(temp);
			
			dispatchEvent(new Event("initComplete" , true));
			
		}
		
		private function doneInit():void {
			
			trace("Done initializing.");
			state = STATE_MENU;
			
		}
		
		public function handleTouch(event:TouchEvent):void {
			
			//If a touch event is finished
			var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
			
			if (touch) {
				
				trace("lame");
				
			}
			
		}
		
	}

}
package {
	
	import flash.ui.GameInput;
	import flash.ui.GameInputControl;
	import flash.ui.GameInputDevice;
	import flash.display3D.Context3DRenderMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import bitmasq.Gamepad;
	import bitmasq.GamepadEvent;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 * this class creates the gameOver screen upon collision detection
	 */


	[SWF(frameRate = "60", width = "800", height = "600", backgroundColor = "0xFF00FF")]
	
	public class Driver extends Sprite {
		
		//private var stats:Stats;

		private var starling:Starling;
		
		public function Driver() {
			
			
			//Creates and starts the starling class with Game.as as its base
			starling = new Starling(Game, stage); //Uncomment for regular mode
			addEventListener(Event.ADDED_TO_STAGE, init);

		}
		
		public function init(ev:Event):void {
			
			//starling = new Starling(Game, stage, null, null, Context3DRenderMode.SOFTWARE); //Uncomment for software mode
			starling.start();
			Gamepad.init(stage);
			
		}
	}
	
		
}
	

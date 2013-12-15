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

	//import net.hires.debug.Stats;
	[SWF(frameRate = "60", width = "800", height = "600", backgroundColor = "0xFF00FF")]
	
	public class Driver extends Sprite {
		
		//private var stats:Stats;

		private var starling:Starling;
		
		public function Driver() {
			
			//stats = new Stats();
			//this.addChild(stats);
			
			//Creates and starts the starling class with Game.as as its base
			//starling = new Starling(Game, stage); //Uncomment for regular mode
			addEventListener(Event.ADDED_TO_STAGE, init);

		}
		
		public function init(ev:Event):void {
			
			starling = new Starling(Game, stage, null, null, Context3DRenderMode.SOFTWARE); //Uncomment for software mode
			starling.start();
			Gamepad.init(stage);
			
		}
	}
	
		
}
	

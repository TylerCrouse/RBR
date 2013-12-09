package {
	
	import flash.display3D.Context3DRenderMode;
	import flash.display.Sprite;
	import starling.core.Starling;
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
			starling = new Starling(Game, stage, null, null, Context3DRenderMode.SOFTWARE); //Uncomment for software mode
			starling.start();
		}
	}
	
		
}
	

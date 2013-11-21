package {
	
	import flash.display3D.Context3DRenderMode;
	import flash.display.Sprite;
	import starling.core.Starling;
	
	[SWF(frameRate = "60", width = "800", height = "600", backgroundColor = "0xFF00FF")]
	
	/**
	 * ...
	 * @author Tyler Crouse and Ian Johnson
	 */
	public class Driver extends Sprite {
		
		private var starling:Starling;
		
		public function Driver() {
			
			//Creates and starts the starling class with Game.as as its base
			//starling = new Starling(Game, stage); //Uncomment for regular mode
			starling = new Starling(Game, stage, null, null, Context3DRenderMode.SOFTWARE); //Uncomment for software mode
			starling.start();
		}
	}
	
		
}
	

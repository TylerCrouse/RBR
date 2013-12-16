package Screens {
	import starling.display.Image;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 * this class creates a pause screen to be superimposed over the game screen
	 */
	public class pauseScreen extends screen{
		
		private var bg:Image;
		
		public function pauseScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("pauseBG"));
			this.addChild(bg);
			
		}
		
		public override function getType():String {
			
			return "pause";
			
		}
	}

}
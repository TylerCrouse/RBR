package Screens {
	import starling.display.Image;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 */
	public class mainMenuScreen extends screen{
		
		private var bg:Image;
		
		public function mainMenuScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("mainMenuBG"));
			this.addChild(bg);
			
		}
		
		public override function getType():String {
			
			return "mainMenu";
			
		}
	}

}
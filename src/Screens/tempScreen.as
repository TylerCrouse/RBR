package Screens {
	import starling.display.Image;
	/**
	 * ...
	 * @author Tyler Crouse and Ian Johnson
	 */
	public class tempScreen extends screen{
		
		private var bg:Image;
		
		public function tempScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("temp"));
			this.addChild(bg);
			
		}
		
		public override function getType():String {
			
			return "mainMenu";
			
		}
	}

}
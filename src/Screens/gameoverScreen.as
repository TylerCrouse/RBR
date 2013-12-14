package Screens {
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.Event;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 */
	public class gameoverScreen extends screen{
		
		private var bg:Image;
		
		public function gameoverScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("gameoverBG"));
			this.addChild(bg);
		}
		
		public override function getType():String {
			
			return "gameover";
			
		}
		
		public override function tick():void 
		{
		
		}
		
	}

}
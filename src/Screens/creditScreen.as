package Screens {
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.Event;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 * this class creates the credits screen
	 */
	public class creditScreen extends screen{
		
		private var bg:Image;
		private var backButton:MovieClip;

		
		public function creditScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("creditsBG"));
			this.addChild(bg);
			backButton = new MovieClip(Assets.getAtlas().getTextures("backText"), 10);
			backButton.y = 50;
			backButton.x = 650;
			addChild(backButton);
			
		}
		
		public override function getType():String {
			
			return "credits";
			
		}
		
		public override function tick():void 
		{
		
		}
		
		public override function handleTouch(touch:Touch):void {
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (backButton.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching 'back to menu' touched event.");
					dispatchEvent(new Event("menuSelect", true));
				}
			}
		}
	}

}
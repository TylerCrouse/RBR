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
		private var backButton:MovieClip;
		private var soundMenu:soundPlayer;
		
		public function gameoverScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("gameoverBG"));
			backButton = new MovieClip(Assets.getAtlas().getTextures("backText"), 10);
			backButton.y = 130;
			backButton.x = 650;
			
			this.addChild(bg);
			this.addChild(backButton);
		}
		
		public override function getType():String {
			
			return "gameover";
			
		}
		
		public override function tick():void 
		{
		
		}
		public override function handleTouch(touch:Touch):void {
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (backButton.getBounds(this.parent).containsPoint(point)) {
					soundMenu = new soundPlayer();
					soundMenu.playSound("mainMenu");
					trace("Dispatching 'back to menu' touched event.");
					dispatchEvent(new Event("menuSelect", true));
				}
			}
		}
		
	}

}
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
	public class mainMenuScreen extends screen{
		
		private var bg:Image;
		private var playText:MovieClip;
		private var creditText:MovieClip;
		private var settingsText:MovieClip;
		
		public function mainMenuScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("mainMenuBG"));
			
			playText = new MovieClip(Assets.getAtlas().getTextures("playText"), 10);
			creditText = new MovieClip(Assets.getAtlas().getTextures("creditText"), 10);
			settingsText = new MovieClip(Assets.getAtlas().getTextures("settingsText"), 10);
			
			addChild(bg);
			
			addChild(playText);
			addChild(creditText);
			addChild(settingsText);
			
			playText.x = 400 - playText.width/2;
			playText.y = 250;
			
			settingsText.x = 400 - settingsText.width/2;
			settingsText.y = 300;
			
			creditText.x = 400 - creditText.width/2;
			creditText.y = 350;
			
			
			
		}
		
		public override function handleTouch(touch:Touch):void {
			
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (playText.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching levelSelect touched event.");
					dispatchEvent(new Event("levelSelect", true));
				}
				
			}
			
		}
		
		public override function getType():String {
			
			return "mainMenu";
			
		}
	}

}
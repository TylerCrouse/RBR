package Screens {
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.Event;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 * this class creates the main menu screen with navigation to other screens
	 */
	public class mainMenuScreen extends screen{
		
		private var bg:Image;
		private var playText:MovieClip;
		private var creditText:MovieClip;
		private var controlsText:MovieClip;
		
		public function mainMenuScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("mainMenuBG"));
			
			playText = new MovieClip(Assets.getAtlas().getTextures("playText"), 10);
			creditText = new MovieClip(Assets.getAtlas().getTextures("creditText"), 10);
			controlsText = new MovieClip(Assets.getAtlas().getTextures("controlsText"), 10);
			
			addChild(bg);
			
			addChild(playText);
			addChild(creditText);
			addChild(controlsText);
			
			playText.x = 200 - playText.width/2;
			playText.y = 225;
			
			controlsText.x = 400 - controlsText.width/2;
			controlsText.y = 275;
			
			creditText.x = 600 - creditText.width/2;
			creditText.y = 450;
			
			
			
		}
		
		public override function handleTouch(touch:Touch):void {
			
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (playText.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching levelSelect touched event.");
					dispatchEvent(new Event("levelSelect", true));
				}
				else if (creditText.getBounds(this.parent).containsPoint(point)){
					trace("dispatch credits event");
					dispatchEvent(new Event("creditSelect", true));
			
				}
				else if (controlsText.getBounds(this.parent).containsPoint(point)){
					trace("dispatch controls event");
					dispatchEvent(new Event("controlsSelect", true));
				}
			}
			
		}
		
		public override function getType():String {
			
			return "mainMenu";
			
		}
	}

}
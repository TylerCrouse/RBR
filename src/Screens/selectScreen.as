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
	public class selectScreen extends screen{
		
		private var bg:Image;
		private var level1Text:MovieClip;
		private var level2Text:MovieClip;
		private var level3Text:MovieClip;
		private var level4Text:MovieClip;
		private var backButton:MovieClip;
		
		public function selectScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("selectLevelBG"));
			addChild(bg);
			
			level1Text = new MovieClip(Assets.getAtlas().getTextures("I"), 10);
			level2Text = new MovieClip(Assets.getAtlas().getTextures("T"), 10);
			level3Text = new MovieClip(Assets.getAtlas().getTextures("S"), 10);
			level4Text = new MovieClip(Assets.getAtlas().getTextures("N"), 10);
			backButton = new MovieClip(Assets.getAtlas().getTextures("backText"), 10);
			
			backButton.y = 50;
			backButton.x = 650;
		
			
			level1Text.x = 100;
			level1Text.y = 200;
			
			level2Text.x = 200;
			level2Text.y = 200;
			
			level3Text.x = 300;
			level3Text.y = 200;
			
			level4Text.x = 400;
			level4Text.y = 200;
			
			addChild(level1Text);
			addChild(level2Text);
			addChild(level3Text);
			addChild(level4Text);
			addChild(backButton);
			
		}
		
		public override function handleTouch(touch:Touch):void {
			
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (level1Text.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching levelSelect touched event.");
					var ev:Event = new Event("play", true, 1);
					dispatchEvent(ev);
				}
				else if (backButton.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching 'back to menu' touched event.");
					dispatchEvent(new Event("menuSelect", true));
				}
				
			}
			
		}
		
		public override function getType():String {
			
			return "levelSelect";
			
		}
	}

}
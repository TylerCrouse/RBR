package Screens {
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 */
	public class selectScreen extends screen{
		
		private var bg:Image;
		private var down:Image;
		private var up:Image;
		private var play:MovieClip;
		private var backButton:MovieClip;
		private var myText:TextField;
		private var numEnemies:Number = 1;
		
		public function selectScreen() {
			startScreen();	
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("selectLevelBG"));
			addChild(bg);
			
			down = new Image(Assets.getTexture("minus"));
			up = new Image(Assets.getTexture("plus"));
			play = new MovieClip(Assets.getAtlas().getTextures("play"), 10);
			backButton = new MovieClip(Assets.getAtlas().getTextures("backText"), 10);
			myText = new TextField(64, 32, "1",  "Bitmap_Font", 32, 0xFFFFFF);
			
			backButton.y = 50;
			backButton.x = 650;
		
			down.x = 100;
			down.y = 200;
			
			up.x = 200;
			up.y = 200;
			
			play.x = 300;
			play.y = 200;
			
			myText.x = 400;
			myText.y = 200;
			
			addChild(down);
			addChild(up);
			addChild(play);
			addChild(backButton);
			addChild(myText);
			
		}
		
		public override function handleTouch(touch:Touch):void {
			
			if (touch) {
				
				var point:Point = touch.getLocation(this);
				
				if (down.getBounds(this.parent).containsPoint(point)) {
					//trace("Dispatching levelSelect touched event.");
					//var ev:Event = new Event("play", true, 1);
					//dispatchEvent(ev);
					if(numEnemies > 0){
						numEnemies--;
					}
					myText.text = numEnemies.toString();
					myText.redraw();
					
				}
				if (up.getBounds(this.parent).containsPoint(point)) {
					numEnemies++;
					myText.text = numEnemies.toString();
					myText.redraw();
					
				}
				if (play.getBounds(this.parent).containsPoint(point)) {
					trace("Dispatching levelSelect touched event.");
					var ev:Event = new Event("play", true, numEnemies);
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
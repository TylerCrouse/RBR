package Screens {
	import Objects.enemy;
	import Objects.tempObj;
	import starling.display.Image;
	import starling.events.Touch;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 */
	public class tempScreen extends screen{
		
		private var bg:Image;
		private var temp:tempObj;
		private var enemyobj:enemy;
		
		public function tempScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("temp"));
			this.addChild(bg);
			temp = new tempObj();
			enemyobj = new enemy(200, 200, 1, 2);
			addChild(temp);
			addChild(enemyobj);
			
		}
		
		public override function getType():String {
			
			return "play";
			
		}
		
		public override function tick():void 
		{
			temp.tick();
			enemyobj.move();
		}
		
		public override function handleTouch(touch:Touch):void {
			temp.handleTouch(touch);
		}
	}

}
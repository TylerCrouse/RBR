package Screens {
	import Objects.enemy;
	//import Objects.tempObj;
	import starling.display.Image;
	import starling.events.Touch;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 */
	public class creditScreen extends screen{
		
		private var bg:Image;
		//private var temp:tempObj;
		private var enemyobj:enemy;
		
		public function creditScreen() {
			
			startScreen();
			
		}
		
		protected override function startScreen():void {
			
			bg = new Image(Assets.getTexture("creditBG"));
			this.addChild(bg);
			
			
		}
		
		public override function getType():String {
			
			return "credits";
			
		}
		
		public override function tick():void 
		{
		
		}
		
		public override function handleTouch(touch:Touch):void {
			//temp.handleTouch(touch);
		}
	}

}
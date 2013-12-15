package tileMap.tiles {
	
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;

	//All of the tiles extend from this
	public class tile extends Sprite {		
		
		public function tile() {
			
		}
		
		protected function init():void {
			
		}
		
		public function getType():String {
			
			return "none";
			
		}
		
	}

}
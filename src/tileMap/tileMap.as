package tileMap {
	import Collections.tileCollector;
	import starling.display.Sprite;
	
	public class tileMap extends Sprite{
		

		var levelMap:tileCollector;
		
		public function tileMap() {
			
		}
		
		public function tick() {
			
			//handle moving all objects in tile map
			
		}
		
		public function loadMap(x:Number) {
			
			levelMap = new tileCollector(x);
			fillMap();
			
		}
		
		public function moveMap(x:Number) {
			
			var i:int = 0;
			for (i = 0; i < levelMap.getSize(); i++) {
				
				levelMap.getItemAt(i).x -= x;
				
			}
			
			
		}
		
		public function getSize():int {
			
			return levelMap.getSize();
			
		}
		
		private function fillMap() {
		
			var i:int = 0;
			for (i = 0; i < levelMap.getSize(); i++) {
				
				this.addChild(levelMap.getItemAt(i));
				
			}	
			
		}
		
	}

}
package tileMap {
	
	import Collections.tileCollector;
	import starling.display.Sprite;
	
	//Class for collecting tiles into a single tile map
	public class tileMap extends Sprite{
		
		//Tile collection utility
		var levelMap:tileCollector;
		
		public function tileMap():void {
			
		}
		
		public function tick():void {
			
		}
		
		//Called by whoever is using the tileMap to create a new map and load it
		public function loadMap():void {
			
			levelMap = new tileCollector();
			fillMap();
			
		}
		
		//Moves the map, positive numbers move the map right
		public function moveMap(x:Number):void {
			
			var i:int = 0;
			for (i = 0; i < levelMap.getSize(); i++) {
				
				levelMap.getItemAt(i).x -= x;
				
			}
			
			
		}
		
		//The number of tile being held by the collector
		public function getSize():int {
			
			return levelMap.getSize();
			
		}
		
		//Adds tiles to the tile collector
		private function fillMap():void {
		
			var i:int = 0;
			for (i = 0; i < levelMap.getSize(); i++) {
				
				this.addChild(levelMap.getItemAt(i));
				
			}	
			
		}
		
	}

}
package  Collections {
	
	import tileMap.tiles.tile;

	//This class gurantees a gameObject in an array
	//lets it run gameObject methods on them
	public class tileCollector {
		
		private var objArray:Array;
		
		public function tileCollector() {
			
			 objArray = new Array();
			 
		}
   
		public function addItem(item:tile):void {
			
			objArray.push(item);
			
		}

		public function getSize():Number {
			
			return objArray.length;
			
		}
		
		//Gets an item, gurantees a gameObject type
		public function getItemAt(index:Number):tile {
			
			return gameObject(objArray[index]);
			
		}
		
		//Empties the array, used to reset the state
		public function clear():void {
			
			objArray = null;
			objArray = new Array();
			
		}
	}
}

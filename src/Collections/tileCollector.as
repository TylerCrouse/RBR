package  Collections {
	
	import tileMap.tiles.*;

	//This class gurantees a gameObject in an array
	//lets it run gameObject methods on them
	public class tileCollector {
		
		var selectedLevel = new Array(
		[8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8],
		[5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
		[3, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7],
		[3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[3, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
		[4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8]);
		
		var currLevel:Number;
		private var objArray:Array;
		
		public function tileCollector(x:Number) {
			
			objArray = new Array();
			currLevel = x;
			loadLevel();
			
		}
		
		public function loadLevel() {
			var i:int = 0;
			var j:int = 0;
			for (i = 0; i < selectedLevel.length; i++) {
				
				var arr:Array = selectedLevel[i];
				
				for (j = 0; j < arr.length; j++) {
					var item:tile
					if (arr[j] == 0) {
						item = new sand();
					}
					else if (arr[j] == 1) {
						item = new cliff1();
					} else if (arr[j] == 2) {
						item = new cliff2();
					}else if (arr[j] == 3) {
						item = new cliff3();
					}else if (arr[j] == 4) {
						item = new cliffCorner1();
					}else if (arr[j] == 5) {
						item = new cliffCorner2();
					}else if (arr[j] == 6) {
						item  = new dirtToSand1();
					}else if (arr[j] == 7) {
						item = new dirtToSand2();
					}else if (arr[j] == 8) {
						item = new grass1();
					}
					item.x = j * item.width;
					item.y = i * item.height;
					this.addItem(item);
					
				}
				
				
			}
			
			
			
		}
   
		public function addItem(item:tile):void {
			
			objArray.push(item);
			
		}

		public function getSize():Number {
			
			return objArray.length;
			
		}
		
		//Gets an item, gurantees a gameObject type
		public function getItemAt(index:Number):tile {
			
			return tile(objArray[index]);
			
		}
		
		public function setItemAt(index:Number, obj:tile) {
			
			objArray[index] = obj;
			
		}
		
		//Empties the array, used to reset the state
		public function clear():void {
			
			objArray = null;
			objArray = new Array();
			
		}
	}
}
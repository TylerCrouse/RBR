package  Collections {
	
	import Objects.gameObject;

	//gameScreen uses this class to gurantee a gameObject in an array
	//lets it run gameObject methods on them
	public class gameObjectCollector {
		
		 private var objArray:Array;
		
		public function gameObjectCollector() {
			
			 objArray = new Array();
			 
		}
   
		public function addItem(item:gameObject):void {
			
			objArray.push(item);
			
		}

		public function getSize():Number {
			
			return objArray.length;
			
		}
		
		//Gets an item, gurantees a gameObject type
		public function getItemAt(index:Number):gameObject {
			
			return gameObject(objArray[index]);
			
		}
		
		//Empties the array, used in the games reset
		public function clear():void {
			
			objArray = null;
			objArray = new Array();
			
		}
	}
}

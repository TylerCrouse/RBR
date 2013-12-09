package  Collections {
	
	import Objects.gameObject;

	//This class gurantees a gameObject in an array
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
		
		//Empties the array, used to reset the state
		public function clear():void {
			
			objArray = null;
			objArray = new Array();
			
		}
	}
}

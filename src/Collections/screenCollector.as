package  Collections {
	
	import Screens.screen;

	//gameScreen uses this class to gurantee a gameObject in an array
	//lets it run gameObject methods on them
	public class screenCollector {
		
		private var screenArray:Array;
		
		public function screenCollector() {
			
			 screenArray = new Array();
			 
		}
   
		public function addItem(item:screen):void {
			
			screenArray.push(item);
			
		}

		public function getSize():Number {
			
			return screenArray.length;
			
		}
		
		//Gets an item, gurantees a screen type
		public function getItemAt(index:Number):screen {
			
			return screen(screenArray[index]);
			
		}
		
		//Empties the array, used in the games reset
		public function clear():void {
			
			screenArray = null;
			screenArray = new Array();
			
		}
	}
}

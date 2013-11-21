package  Collections {
	
	import Screens.screen;

	//Gurantees a screen object
	//lets it run screen methods on it
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
		
		//Empties the array, used to reset the state
		public function clear():void {
			
			screenArray = null;
			screenArray = new Array();
			
		}
	}
}

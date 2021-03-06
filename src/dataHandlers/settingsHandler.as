package dataHandlers {
	
	import flash.net.SharedObject;

	public class settingsHandler {
		
		private var saveData:SharedObject;
		
		public function settingsHandler() {
			
			init();
			
		}
		
		private function init():void {
			
			saveData = SharedObject.getLocal("settings");
			
		}
		
		public function setMaxSpeed(maxSpeed:Number):void {
			
			saveData.data.maxSpeed = maxSpeed;
			
		}
		
		public function getMaxSpeed():Number {
			
			return saveData.data.maxSpeed;
			
		}
		
		
		public function save():void {
			
			saveData.flush();
			
		}
		
	}

}
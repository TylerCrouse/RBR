package Screens {
	
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	
	
	//All screen types extend this
	//They must override all functions or give the default functionality
	public class screen extends Sprite {
		
		protected function startScreen():void {
		}
		
		public function reset():void {
		}
		
		public function tick():void {	
		}
		
		public function getType():String {
			return "none";	
		}
		
		public function getTicks():int {
			return -1;
		}
		
		public function handleKeyDown(event:KeyboardEvent):void{
		}

		public function handleKeyUp(event:KeyboardEvent):void{
		}
		
	}
	
}
package  Collections {
	
	import flash.geom.Rectangle;
	import Objects.enemy;
	public class enemyCollector {
		
		private var screenArray:Array;
		
		public function enemyCollector() {
			
			 screenArray = new Array();
			 
		}
   
		public function addItem(item:enemy):void {
			
			screenArray.push(item);
			
		}
		
		public function checkCollision(pos:Rectangle):Boolean {
			
			var i:int = 0;
			var didHit:Boolean = false;
			
			for (i = 0; i < getSize(); i++) {
				
				didHit = getItemAt(i).checkCollision(pos);
				
				if (didHit) {
					break;
				}
			}
			
			return didHit;
			
		}
		
		public function tick():void {
			var i:int = 0;
			
			for (i = 0; i < getSize(); i++) {
				
				getItemAt(i).tick();
				
			}
			
			
		}
		
		public function moveEnemies(x:Number):void {
			var i:int = 0;
			
			for (i = 0; i < getSize(); i++) {
				
				getItemAt(i).x -= x;
				
			}
			
		}

		public function getSize():Number {
			
			return screenArray.length;
			
		}
		
		//Gets an item, gurantees a screen type
		public function getItemAt(index:Number):enemy {
			
			return enemy(screenArray[index]);
			
		}
		
		//Empties the array, used to reset the state
		public function clear():void {
			
			screenArray = null;
			screenArray = new Array();
			
		}
	}
}

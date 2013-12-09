package Screens {
	import Objects.enemy;
	import Objects.gameObject;
	import Objects.playerObject;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import tileMap.tileMap;

	public class gameScreen extends screen{
		
		private var numTicks:int = 0;
		private var currentMap:tileMap;
		private var player:gameObject;
		private var enemy1:enemy;
		private var leftDown:Boolean = false;
		private var rightDown:Boolean = false;
		
		public function gameScreen() {
			
			startScreen();
			
		}
		
		public override function tick(): void {
			
			numTicks++;
			player.tick();
			enemy1.tick();
			move();
			enemy1.checkCollision(player.bounds);
		}
		
		private function move():void {
			
			//if keydown move map
			if (leftDown) {
				currentMap.moveMap(-3);
				player.x -= -3;
				enemy1.x -= -3;
				player.setDestX(player.getDestX() + 3);
			}else if (rightDown) {
				currentMap.moveMap(3);
				player.x -= 3;
				enemy1.x -= 3;
				player.setDestX(player.getDestX() - 3);
			}
		}
		
		protected override function startScreen():void {
			
			currentMap = new tileMap();
			currentMap.loadMap(1);
			
			player = new playerObject();
			
			enemy1 = new enemy(200, 200, 1, 1);
			
			addChild(currentMap);
			addChild(enemy1);
			addChild(player);
			trace("Adding game screen");
			
		}
		
		public override function handleKeyDown(event:KeyboardEvent):void {
			
			if (event.keyCode == 37) {
				//move left
				leftDown = true;
			}else if (event.keyCode == 39) {
				//move right
				rightDown = true;
			}
			
		}

		public override function handleKeyUp(event:KeyboardEvent):void {
			
			if (event.keyCode == 37) {
				//move left
				leftDown = false;
			}else if (event.keyCode == 39) {
				//move right
				rightDown = false;
			}
			
		}
		
		public override function handleTouch(touch:Touch):void {
			
			if (touch) {
				
				player.handleTouch(touch);
				
			}
			
			
		}
		
		
		public override function getType():String {
			
			return "gameScreen";
			
		}
		
		public override function getTicks():int {
			
			return numTicks;
			
		}
		
		
		
	}

}
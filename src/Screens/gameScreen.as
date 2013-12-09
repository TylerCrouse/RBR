package Screens {
	import Objects.enemy;
	import Objects.gameObject;
	import Objects.playerObject;
	import tileMap.tileMap;

	public class gameScreen extends screen{
		
		private var numTicks:int = 0;
		private var currentMap:tileMap;
		private var player:gameObject;
		private var enemy1:enemy;
		
		public function gameScreen() {
			
			startScreen();
			
		}
		
		public override function tick(): void {
			
			numTicks++;
			player.tick();
			enemy1.move();
			move();
			
		}
		
		private function move():void {
			
			//if keydown move map
			
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
		
		public override function getType():String {
			
			return "gameScreen";
			
		}
		
		public override function getTicks():int {
			
			return numTicks;
			
		}
		
		
		
	}

}
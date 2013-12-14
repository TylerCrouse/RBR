package Screens {
	import bitmasq.Gamepad;
	import bitmasq.GamepadEvent;
	import Collections.enemyCollector;
	import flash.geom.Point;
	//import flash.text.TextField;
	import levelData.levelLoader;
	import levelData.levels.*;
	import Objects.enemy;
	import Objects.gameObject;
	import Objects.playerObject;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;
	import tileMap.tileMap;
	import starling.text.TextField;

	public class gameScreen extends screen{
		
		private var numTicks:int = 0;
		private var selectedLevel:int;
		private var currentMap:tileMap;
		private var player:gameObject;
		private var enemies:enemyCollector;
		private var leftDown:Boolean = false;
		private var rightDown:Boolean = false;
		private var myText:TextField;
		
		
		public function gameScreen(x:int) {
			selectedLevel = x;
			startScreen();
		}
		
		public override function tick(): void {
			
			numTicks++;
			player.tick();
			win = player.checkWin();
			collision = enemies.checkCollision(player.bounds);
			enemies.tick();
			move();
			
			
		}
		
		private function move():void {
			
			//if keydown move map
			if (leftDown) {
				currentMap.moveMap(-7);
				player.setX(7);
				enemies.moveEnemies(-7);
				player.destX = player.destX + 7;
				
				
			}else if (rightDown) {
				currentMap.moveMap(7);
				player.setX(-7);
				enemies.moveEnemies(7);
				player.destX = player.destX - 7;

			}
		}
		
		protected override function startScreen():void {
			
			player = new playerObject();
			
			var loadLevel:levelLoader = new levelLoader();
			var currLevel:level = loadLevel.loadLevel(2);
			currentMap = currLevel.loadLevelMap();
			
			
			enemies = currLevel.dynamicLoad(selectedLevel);
			
			
			addChild(currentMap);
			var i:int = 0;
			for (i = 0; i < enemies.getSize(); i++){
			
				addChild(enemies.getItemAt(i));
				
			}
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
		
		public override function handleJoystick(event:GamepadEvent):void {
			
			player.handleJoystick(event);
			
		}
		
		
		public override function getType():String {
			
			return "gameScreen";
			
		}
		
		public override function getTicks():int {
			
			return numTicks;
			
		}
		
		
		
	}

}
package levelData.levels {
	
	import Collections.enemyCollector;
	import Objects.enemy;
	import tileMap.tileMap;

	public class levelGenerator extends level{
		
		public function levelGenerator() {
		}
		
		public override function loadLevelMap():tileMap {
			
			var map:tileMap = new tileMap();
			map.loadMap();
			return map;
			
		}
		
		public override function loadEnemyData():enemyCollector {
			
			var enemies:enemyCollector = new enemyCollector();
			enemies.addItem(new enemy(300, 200, -1, 1, 6));
			enemies.addItem(new enemy(200, 400, 1, 1, 4));
			enemies.addItem(new enemy(290, 300, -1, 1, 3));
			enemies.addItem(new enemy(190, 300, -1, -1, 6));
			enemies.addItem(new enemy(600, 300, 0, -1, 9));
			return enemies;
			
		}
		
		public override function dynamicLoad(numEnemies:Number):enemyCollector {
			
			var enemies:enemyCollector = new enemyCollector();
			
			var enemyLevel = 0;
			var enemyCount = 21 + (numEnemies % 10);
			
			while (numEnemies > 0) {
				
				enemyLevel = enemyLevel + (numEnemies % 10)* 2.5;
				numEnemies = numEnemies / 10;
				
			}
			var seed:Number = 0;
			
			if (enemyLevel == 0) {
				seed = 0;
			}else seed = enemyLevel / 100;
			
			var spread:Number = 2496 / enemyCount;
			
			var minSpeed = 4 + (4 * seed);
			
			var i:int = 0;
			for (i = 0; i < enemyCount; i++) {
				
				trace("seed is " + seed + ". Min speed is " + minSpeed);
				
				var nextEnemy:enemy = new enemy((i*spread) + 124, (Math.random() * 344) + 96, Math.random() - 1, Math.random() - 1, Math.random() * 4 + minSpeed);
				
				if ((Math.random() < seed)) {
					
					trace("increasing an enemies speed");
					nextEnemy.changeSpeed(minSpeed);
					
				}else if ((Math.random() < seed)) {
					
					trace("increasing and enemies size");
					nextEnemy.increaseSize();
					
				}
				
				enemies.addItem(nextEnemy); 
				
			}
			return enemies;
		}
		
		
		
	}

}
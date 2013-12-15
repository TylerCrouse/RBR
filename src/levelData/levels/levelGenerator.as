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
		
		public override function dynamicLoad(numEnemies:int):enemyCollector {
			
			var enemies:enemyCollector = new enemyCollector();
			
			var enemyLevel:Number = 0;
			var enemyCount:Number = 15 + (numEnemies % 10);
						
			while (numEnemies > 0) {
				
				enemyLevel = enemyLevel * 15 + (numEnemies % 10);
				numEnemies = numEnemies / 10;
				
			}
			
			var seed:Number = 0;
			
			if (enemyLevel == 0) {
				seed = 0;
			}else seed = enemyLevel / 100;
			
			
			
			var spread:Number = 2296 / enemyCount;
			
			var minSpeed:Number = 6 + (10 * seed);
			
			trace("seed is " + seed + ". Min speed is " + minSpeed + " The enemies level is " + enemyLevel);
			
			while (Math.random() + Math.random() < seed) {
				trace("Rolled an extra enemy");
				enemyCount++;
			}
			
			var numUpgraded:int = 0;
			var i:int = 0;
			
			for (i = 0; i < enemyCount; i++) {
				
				
				
				var nextEnemy:enemy = new enemy((i*spread) + 124, (Math.random() * 344) + 96, Math.random() - 1, Math.random() - 1, (Math.random() * 3) + minSpeed);
				
				while (Math.random() < seed) {
					nextEnemy.changeSpeed(minSpeed);
					numUpgraded++;
				}
				
				while (Math.random() < seed) {
					nextEnemy.increaseSize();
					numUpgraded++;
				}
				
				enemies.addItem(nextEnemy); 
				
			}
			
			trace("Placed " + i + " enemies. There was " + numUpgraded + " enemies upgraded.");
			
			return enemies;
		}
		
		
		
	}

}
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
			var i:int = 0;
			for (i = 0; i < numEnemies; i++) {
				enemies.addItem(new enemy((Math.random() * 2400) + 96, (Math.random() * 344) + 96, Math.random() - 1, Math.random() - 1, Math.random() * 10)); 
			}
			return enemies;
		}
		
		
		
	}

}
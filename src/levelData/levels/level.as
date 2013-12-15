package levelData.levels {
	
	import Collections.enemyCollector;
	import Objects.enemy;
	import tileMap.tileMap;

	public class level {
		
		public function level() {
			
			
			
		}
		
		public function loadLevelMap():tileMap {
			
			var map:tileMap = new tileMap();
			return map;
			
		}
		
		public function loadEnemyData():enemyCollector {
			
			var enemies:enemyCollector = new enemyCollector();
			return enemies;
			
		}
		
		public function dynamicLoad(numEnemies:int):enemyCollector {
			var enemies:enemyCollector = new enemyCollector();
			return enemies;
		}
		
		
		
	}

}
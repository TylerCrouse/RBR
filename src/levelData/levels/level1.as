package levelData.levels {
	
	import Collections.enemyCollector;
	import Objects.enemy;
	import tileMap.tileMap;

	public class level1 extends level{
		
		public function level1() {
			
			
			
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
		
		
		
	}

}
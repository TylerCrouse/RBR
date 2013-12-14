package levelData {

	import levelData.levels.*;
	
	public class levelLoader {
		
		public function levelLoader() {
			
		}
		
		
		public function loadLevel(x:int):level {
			
			if (x == 2) {
				return new levelGenerator();
			}
			if (x == 1) {
				return new level1();
			}else return new level();
			
			
		}
	}

}
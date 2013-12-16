package levelData {

	import levelData.levels.*;
	/**
	 * ...
	 * @author Keven Abbott, Tyler Crouse and Ian Johnson
	 * this class uses the level generator class to load the generated level 
	 */
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
package Objects {
	import starling.display.MovieClip;
	/**
	 * ...
	 * @author Tyler Crouse and Ian Johnson
	 */
	public class tempObj extends gameObject{
		
		private var temp:MovieClip;
		
		public function tempObj() {
			
			temp = new MovieClip(Assets.getAtlas().getTextures("tempSprite"), 10);
			this.addChild(temp);
			
		}
		
	}

}
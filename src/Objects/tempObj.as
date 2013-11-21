package Objects {
	import starling.display.MovieClip;

	//Placeholder because testing
	public class tempObj extends gameObject{
		
		private var temp:MovieClip;
		
		public function tempObj() {
			
			temp = new MovieClip(Assets.getAtlas().getTextures("tempSprite"), 10);
			this.addChild(temp);
			
		}
		
	}

}
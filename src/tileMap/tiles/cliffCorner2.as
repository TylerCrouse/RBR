package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Top left corner
	public class cliffCorner2 extends tile{
		
		private var cliffCornerSprite:MovieClip;
		
		public function cliffCorner2() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffCornerSprite = new MovieClip(Assets.getTile().getTextures("cliffCorner2"), 45);
			
			cliffCornerSprite.x = Math.ceil(-cliffCornerSprite.width/2);
			cliffCornerSprite.y = Math.ceil( -cliffCornerSprite.height / 2);
			
			this.addChild(cliffCornerSprite);
			
		}
		
		//The second type of corner
		public override function getType():String {
			
			return "cliffCorner2";
			
		}
		
	}

}
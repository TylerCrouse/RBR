package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class cliffCorner3 extends tile{
		
		private var cliffCornerSprite:MovieClip;
		
		//Top right corner
		public function cliffCorner3() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffCornerSprite = new MovieClip(Assets.getTile().getTextures("cliffCorner3"), 45);
			
			cliffCornerSprite.x = Math.ceil(-cliffCornerSprite.width/2);
			cliffCornerSprite.y = Math.ceil( -cliffCornerSprite.height / 2);
			
			this.addChild(cliffCornerSprite);
			
		}
		
		//Third type of corner
		public override function getType():String {
			
			return "cliffCorner3";
			
		}
		
	}

}
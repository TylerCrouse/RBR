package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Bottom left corner
	public class cliffCorner1 extends tile{
		
		private var cliffCornerSprite:MovieClip;
		
		public function cliffCorner1() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffCornerSprite = new MovieClip(Assets.getTile().getTextures("cliffCorner1"), 45);
			
			cliffCornerSprite.x = Math.ceil(-cliffCornerSprite.width/2);
			cliffCornerSprite.y = Math.ceil( -cliffCornerSprite.height / 2);
			
			this.addChild(cliffCornerSprite);
			
		}
		
		//First corner type
		public override function getType():String {
			
			return "cliffCorner1";
			
		}
		
	}

}
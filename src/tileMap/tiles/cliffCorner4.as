package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class cliffCorner4 extends tile{
		
		private var cliffCornerSprite:MovieClip;
		
		public function cliffCorner4() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffCornerSprite = new MovieClip(Assets.getTile().getTextures("cliffCorner4"), 45);
			cliffCornerSprite.x = Math.ceil(-cliffCornerSprite.width/2);
			cliffCornerSprite.y = Math.ceil( -cliffCornerSprite.height / 2);
			this.addChild(cliffCornerSprite);
			
		}
		
		public override function tick():void {
			
		}
		
		public override function moveTo(x:int, y:int):void {
			
			cliffCornerSprite.x = x;
			cliffCornerSprite.y = y;
			
		}
		
		public override function getType():String {
			
			return "cliffCorner4";
			
		}
		
		public override function hasCollision():Boolean {
			
			return true;
			
		}
		
	}

}
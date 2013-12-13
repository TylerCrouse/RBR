package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class finish2 extends tile{
		
		private var cliffSprite:MovieClip;
		
		public function finish2() {
			
			init();
			
		}
		
		protected override function init():void {
			
				cliffSprite = new MovieClip(Assets.getTile().getTextures("finish2"), 45);

			cliffSprite.x = Math.ceil(-cliffSprite.width/2);
			cliffSprite.y = Math.ceil( -cliffSprite.height / 2);
			
			this.addChild(cliffSprite);
			
		}
		
		public override function tick():void {
			
		}
		
		public override function moveTo(x:int, y:int):void {
			
			cliffSprite.x = x;
			cliffSprite.y = y;
			
		}
		
		public override function getType():String {
			
			return "cliff1";
			
		}
		
		public override function hasCollision():Boolean {
			
			return true;
			
		}
		
	}

}
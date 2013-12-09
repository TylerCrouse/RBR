package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class grass1 extends tile{
		
		private var grassSprite:MovieClip;
		
		public function grass1() {
			
			init();
			
		}
		
		protected override function init():void {
			
			grassSprite = new MovieClip(Assets.getTile().getTextures("grass1"), 45);
			grassSprite.x = Math.ceil(-grassSprite.width/2);
			grassSprite.y = Math.ceil( -grassSprite.height / 2);
			
			this.addChild(grassSprite);
			
		}
		
		public override function tick():void {
			
		}
		
		public override function moveTo(x:int, y:int):void {
			
			grassSprite.x = x;
			grassSprite.y = y;
			
		}
		
		public override function getType():String {
			
			return "grass1";
			
		}
		
		public override function hasCollision():Boolean {
			
			return true;
			
		}
		
	}

}
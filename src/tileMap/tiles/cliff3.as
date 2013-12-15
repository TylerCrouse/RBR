package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class cliff3 extends tile{
		
		private var cliffSprite:MovieClip;
		
		//This is the sprite for the left cliffs on the canyon
		public function cliff3() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffSprite = new MovieClip(Assets.getTile().getTextures("cliff5"), 45);
			
			cliffSprite.x = Math.ceil(-cliffSprite.width/2);
			cliffSprite.y = Math.ceil( -cliffSprite.height / 2);
			
			this.addChild(cliffSprite);
			
		}
		
		//Cliff type 3
		public override function getType():String {
			
			return "cliff3";
			
		}
		
	}

}
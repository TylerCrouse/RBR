package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//This is the sprite for the right cliffs on the canyon
	public class cliff4 extends tile{
		
		private var cliffSprite:MovieClip;
		
		public function cliff4() {
			
			init();
			
		}
		
		protected override function init():void {
			
			cliffSprite = new MovieClip(Assets.getTile().getTextures("cliff6"), 45);
			
			cliffSprite.x = Math.ceil(-cliffSprite.width/2);
			cliffSprite.y = Math.ceil( -cliffSprite.height / 2);
			
			this.addChild(cliffSprite);
			
		}
		
		//Cliff type 4
		public override function getType():String {
			
			return "cliff4";
			
		}
		
	}

}
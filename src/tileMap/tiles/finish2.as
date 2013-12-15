package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Finish line sprite
	public class finish2 extends tile{
		
		private var finishSprite:MovieClip;
		
		public function finish2() {
			
			init();
			
		}
		
		protected override function init():void {
			
				finishSprite = new MovieClip(Assets.getTile().getTextures("finish2"), 45);

			finishSprite.x = Math.ceil(-finishSprite.width/2);
			finishSprite.y = Math.ceil( -finishSprite.height / 2);
			
			this.addChild(finishSprite);
			
		}
		
		public override function getType():String {
			
			return "finish2";
			
		}
		
	}

}
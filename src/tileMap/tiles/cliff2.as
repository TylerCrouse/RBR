package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	public class cliff2 extends tile{
		
		private var cliffSprite:MovieClip;
		
		//Cliff 2 are the sprites for the top half of the canyon
		public function cliff2() {
			
			init();
			
		}
		
		protected override function init():void {
			
			var rand:Number = Math.random();

			//Randomly picks from the two sprite types
			if (rand <= .5) {
				cliffSprite = new MovieClip(Assets.getTile().getTextures("cliff3"), 1);
			}else {
				cliffSprite = new MovieClip(Assets.getTile().getTextures("cliff4"), 1);
			}

			cliffSprite.x = Math.ceil(-cliffSprite.width/2);
			cliffSprite.y = Math.ceil( -cliffSprite.height / 2);
			
			this.addChild(cliffSprite);
			
		}
		
		//This is cliff type 2
		public override function getType():String {
			
			return "cliff2";
			
		}

		
	}

}
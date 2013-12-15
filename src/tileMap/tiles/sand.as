package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Sand sprite
	public class sand extends tile{
		
		private var sandSprite:MovieClip;
		
		public function sand() {
			
			init();
			
		}
		
		protected override function init():void {
			
			var rand:Number = Math.random();
			
			//Three different types of sand
			if (rand < .33) {
				sandSprite = new MovieClip(Assets.getTile().getTextures("sand1"), 45);
			}else if (rand <= .67) {
				sandSprite = new MovieClip(Assets.getTile().getTextures("sand2"), 45);
			}else {
				sandSprite = new MovieClip(Assets.getTile().getTextures("sand3"), 45);
			}

			sandSprite.x = Math.ceil(-sandSprite.width/2);
			sandSprite.y = Math.ceil( -sandSprite.height / 2);
			this.addChild(sandSprite);
			
		}
		
		public override function getType():String {
			
			return "sand";
			
		}
		
	}

}
package tileMap.tiles {
	
		import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Sand on the top half of the canyon
	public class dirtToSand2 extends tile{
		
		private var dirtToSandSprite:MovieClip;
		
		public function dirtToSand2() {
			
			init();
			
		}
		
		protected override function init():void {
			
			dirtToSandSprite = new MovieClip(Assets.getTile().getTextures("dirtToSand2"), 45);
			
			dirtToSandSprite.x = Math.ceil(-dirtToSandSprite.width/2);
			dirtToSandSprite.y = Math.ceil( -dirtToSandSprite.height / 2);
			
			this.addChild(dirtToSandSprite);
			
		}
		
		//Second type of dirt to sand
		public override function getType():String {
			
			return "dirtToSand2";
			
		}
		
	}

}
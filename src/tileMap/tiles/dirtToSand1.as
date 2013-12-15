package tileMap.tiles {
	
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import tileMap.tiles.tile;

	//Sand on the bottom half of the canyon
	public class dirtToSand1 extends tile{
		
		private var dirtToSandSprite:MovieClip;
		
		public function dirtToSand1() {
			
			init();
			
		}
		
		protected override function init():void {
			
			dirtToSandSprite = new MovieClip(Assets.getTile().getTextures("dirtToSand1"), 45);
			
			dirtToSandSprite.x = Math.ceil(-dirtToSandSprite.width/2);
			dirtToSandSprite.y = Math.ceil( -dirtToSandSprite.height / 2);
			
			this.addChild(dirtToSandSprite);
			
		}
		
		//First type of dirt to sand
		public override function getType():String {
			
			return "dirtToSand1";
			
		}
		
	}

}
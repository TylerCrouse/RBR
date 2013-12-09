package Objects 
{
	import flash.geom.Rectangle;
	import starling.display.MovieClip;
	import flash.geom.Point;
	import starling.display.Sprite;
	
	public class enemy extends Sprite
	{
		private var enemyobj:MovieClip;
		private var enemyVector:Point = new Point();
		private var enemySpeed:Number = 1;
		
		public function enemy(posx:Number, posy:Number, vecx:Number, vecy:Number){
			enemyobj = new MovieClip(Assets.getAtlas().getTextures("C"), 10);
			
			enemyobj.x = posx;
			enemyobj.y = posy;
			enemyVector = new Point(vecx, vecy);
			this.addChild(enemyobj);
			
		}
		
		private function move() {
			enemyobj.x = enemyobj.x + enemyVector.x*enemySpeed;
			enemyobj.y = enemyobj.y + enemyVector.y*enemySpeed;
			if (enemyobj.x < 32) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.x > 795) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.y < 64) enemyVector.y = enemyVector.y * -1;
			if (enemyobj.y > 600-128) enemyVector.y = enemyVector.y * -1;
		}
		
		public function changeVector(x:Number, y:Number):void {
			enemyVector.x = x;
			enemyVector.y = y;
		}
		
		public function changeSpeed(speed:Number):void {
			enemySpeed = speed;
		}
		
		public function checkCollision(pos:Rectangle):Boolean {
			var bounds:Rectangle;
			bounds = enemyobj.bounds;
			if (bounds.intersects(pos)) {
				//trace("hit confirmed");
				return true;
			}
			return false;
		}
		
		public function tick() {
			move();
		}
		
	}

}
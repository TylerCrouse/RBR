package Objects 
{
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import starling.display.MovieClip;
	import flash.geom.Point;
	import starling.display.Sprite;
	
	public class enemy extends Sprite
	{
		private var enemyobj:MovieClip;
		private var enemyVector:Point = new Point();
		private var enemySpeed:Number;
		
		public function enemy(posx:Number, posy:Number, vecx:Number, vecy:Number, speed:Number = 1) {
			
			enemyobj = new MovieClip(Assets.getAtlas().getTextures("C"), 10);
			enemyobj.x = posx;
			enemyobj.y = posy;
			enemySpeed = speed;
			enemyVector = new Point(vecx, vecy);
			this.addChild(enemyobj);
			
		}
		
		private function move() {
			enemyobj.x = enemyobj.x + enemyVector.x*enemySpeed;
			enemyobj.y = enemyobj.y + enemyVector.y*enemySpeed;
			if (enemyobj.x < 64) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.x > 2496) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.y < 96) enemyVector.y = enemyVector.y * -1;
			if (enemyobj.y > 440) enemyVector.y = enemyVector.y * -1;
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
			var newPoint:Point = localToGlobal(new Point(enemyobj.x, enemyobj.y));
			bounds = new Rectangle(newPoint.x, newPoint.y, enemyobj.bounds.width, enemyobj.bounds.height);
			pos.height = 20;
			pos.width = 40;
			
			
			if (bounds.intersects(pos)) {
				var date:Date = new Date();
				trace("hit confirmed " + date.minutes + ":" + date.seconds);
				return true;
			}
			return false;
		}
		
		public function tick() {
			move();
		}
		
	}

}
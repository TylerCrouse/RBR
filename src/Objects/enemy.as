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
		
		//constructor takes a position, unit vector, and speed.
		public function enemy(posx:Number, posy:Number, vecx:Number, vecy:Number, speed:Number = 1) {
			//create sprite, assign parameters, and add sprite to screen.
			enemyobj = new MovieClip(Assets.getAtlas().getTextures("enemyBallSprite"), 10);
			enemyobj.x = posx;
			enemyobj.y = posy;
			enemySpeed = speed;
			enemyobj.scaleX = .6;
			enemyobj.scaleY = .6;
			enemyVector = new Point(vecx, vecy);
			this.addChild(enemyobj);
			
		}
		
		private function move() {
			//enemy moves based off the unit vector it is given upon declaration
			enemyobj.x = enemyobj.x + enemyVector.x*enemySpeed;
			enemyobj.y = enemyobj.y + enemyVector.y * enemySpeed;
			//Depending on what wall the enemy hits it will change the unit vector.
			if (enemyobj.x < 124) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.x > 2496) enemyVector.x = enemyVector.x * -1;
			if (enemyobj.y < 96) enemyVector.y = enemyVector.y * -1;
			if (enemyobj.y > 440) enemyVector.y = enemyVector.y * -1;
		}
		
		//increased the scale of an enemy.
		public function increaseSize() {
			enemyobj.scaleX = scaleX * 1.1;
			enemyobj.scaleY = scaleY * 1.1;
		}
		
		//changes the unit vector associated with the enemy.
		public function changeVector(x:Number, y:Number):void {
			enemyVector.x = x;
			enemyVector.y = y;
		}
		
		//adds input to the current speed.
		public function changeSpeed(speed:Number):void {
			enemySpeed = enemySpeed + speed;
		}
		
		
		public function checkCollision(pos:Rectangle):Boolean {
			//Rectangle around the player, changed to make detection better.
			pos.x = pos.x - 1;
			pos.y = pos.y - 1;
			pos.width = pos.width - 1;
			pos.height = pos.height - 1;
			
			//convert players position to global coords and make a new rectangle for it
			var bounds:Rectangle;
			var newPoint:Point = localToGlobal(new Point(enemyobj.x, enemyobj.y));
			bounds = new Rectangle(newPoint.x - 1, newPoint.y - 1, enemyobj.bounds.width - (enemyobj.scaleX * .05), enemyobj.bounds.height - (enemyobj.scaleY * .05));	
			
			//checks to see if enemy has collided with player
			//function returns true if collision is detected
			if (bounds.intersects(pos)) {
				var date:Date = new Date();
				trace("hit confirmed " + date.minutes + ":" + date.seconds);
				return true;
			}
			return false;
		}
		
		//enemies move every tick
		public function tick() {
			move();
		}
		
	}

}
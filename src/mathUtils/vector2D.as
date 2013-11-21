package mathUtils {
	import flash.geom.Point;

	//Incomplete, at some point gonna be used for 2d vector movement
	
	public class vector2D extends Point{
		
		public function vector2D(x:Number, y:Number) {
			
			this.x = x;
			this.y = y;
			
		}
		
		public function rotate(angle:Number):void {
			
			var pt:Point = new Point(x * Math.cos(angle) – y * Math.sin(angle), x * Math.sin(angle) + y * Math.cos(angle));
			x = pt.x;
			y = pt.y;
			
		}
		
		public function getAngle():Number {
			
			return Math.atan2(y, x);
			
		}
		
		public function dot(vec:vector2D):Number {
			
			return x*vec.x+y*vec.y;
			
		}
		
		public function getNormal():vector2D {
			
			//Ds = Math.sqrt(x*x+y*y)
			
			return new vector2D(3, 4);
			
		}
		
	}

}
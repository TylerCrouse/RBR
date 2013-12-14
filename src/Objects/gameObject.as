package Objects {
	
	import bitmasq.GamepadEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.events.Touch;

	//All of the gameObjects extend from this
	//All gameObjects must override these methods or use the default returns
	public class gameObject extends Sprite {		
		
		private var accel:Number;
		private var damage:int;
		private var health:int;
		public var destX:Number = 0;
		
		public function gameObject() {
			
		}
		
		protected function init():void {
			
		}
		
		public function tick():void {
			
		}
		
		public function setX(x:Number) {
			
		}
		
		public function startAnimation():void {
			
		}
		
		public function stopAnimation():void {
			
		}
		
		public function setDestX(x:Number):void {
			
			
		}
		
		public function getDestX():Number {
			
			return 1;
			
		}
		
		public function onScreen(x:Number, y:Number):Boolean {
			
			return false;
			
		}
		
		public function getType():String {
			
			return "none";
			
		}
		
		public function moveTo(x:int, y:int):void {
			
			
		}
		
		public function handleJoystick(event:GamepadEvent):void {
			
		}
		
		public function handleCollision(hitObject:gameObject):Boolean {
			
			return false;
			
		}
		
		public function hasCollision():Boolean {
			
			return false;
			
		}
		
		public function getDamageValue():int {
			
			return damage;
			
		}
		
		public function setAcceleration(x:Number):void {
			
			accel = x;
			
		}
		
		public function getHealth():int {
			
			return health;
			
		}
		
		public function handleTouch(touch:Touch):void {
			
		}
		
		private function setHealth(x:int):void {
			
			health = 0;
			
		}
	}

}
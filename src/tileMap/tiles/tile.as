package tileMap.tiles {
	
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;

	//All of the gameObjects extend from this
	//Lets the gameScreen treat all objects in the tilemap as the same type
	public class tile extends Sprite {		
		
		public var onGround:Boolean;
		public var move:Boolean = true;
		
		public function tile() {
			
		}
		
		protected function init():void {
			
		}
		
		public function getXSpeed():int {
			return 0;
		}
		
		public function getYSpeed():int {
			return 0;
		}
		
		public function start():void {
			
		}
		
		public function didHit(hitObject:DisplayObject):Boolean {
			return false;
		}
		
		public function stop():void {
			
		}
		
		public function tick():void {
			
		}
		
		public function getType():String {
			
			return "none";
			
		}
		
		public function moveTo(x:int, y:int):void {
			
			
		}
		
		public function handleCollision(hitObject:tile):Boolean {
			
			return false;
			
		}
		
		public function hasCollision():Boolean {
			
			return false;
			
		}
		
		public function setXSpeed(x:int, hardSet:Boolean):void {
			
		}
		
		public function setYSpeed(y:int, hardSet:Boolean):void {
			
		}
		
		public function handleKeyDown(event:KeyboardEvent):void {
			
		}
		
		public function handleKeyUp(event:KeyboardEvent):void {
			
		}
		
	}

}
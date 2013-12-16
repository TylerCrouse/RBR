package Objects {
		import bitmasq.GamepadEvent;
		import bitmasq.Gamepad;
        import flash.geom.Point;
        import starling.display.MovieClip;
        import starling.events.Touch;
		import starling.core.Starling;

        public class playerObject extends gameObject{
                
                private var temp:MovieClip;
                private var moveSpeed:Number = 12;
                
                private var xMov:Number = 0;
                private var yMov:Number = 0;
                
                //public var destX:Number;
                private var destY:Number;
				private var offset:Number = 0;
                
                private var rotationSpeed:Number = .1;
                private var rotationGoal:Number;
                
                private var skip:int = 0;
                private var rotOffset:Number = 1.57;
                
                public function playerObject() {
                        
                        temp = new MovieClip(Assets.getSpriteAtlas().getTextures("bug"), 25);
						
                        temp.x = 50;
                        temp.y = 300;
						
                        destX = temp.x;
                        destY = temp.y;
						
                        temp.rotation = 1.57;
						
                        temp.alignPivot();
						
						temp.scaleX = .35;
						temp.scaleY = .35;
						
                        this.addChild(temp);
						
						Starling.juggler.add(temp);
                        
                }
				
				public override function setX(x:Number):void {
					
					temp.x += x;
					offset += x;
					
				}
                
                public override function tick():void {
                        
                        //trace("Temp obj is ticking");
                        move();
                        
                }
                
                public override function handleTouch(touch:Touch):void {

                        //trace("Object is handling a touch");
                        if (touch) {
							//trace(touch.toString());
							var pt:Point = new Point(touch.globalX, touch.globalY);	
							//pt = localToGlobal(pt);
							//trace("Touched at : " + pt.x + ", " + pt.y);
							//trace("Object at : " + temp.x + ", " + temp.y);
							turnToFace(pt.x, pt.y);
							moveTowards(pt.x, pt.y);
						}
                        
                        
                }
                
                private function turnToFace(x:Number, y:Number):void {
                        
						//trace("turning to face " + temp.x + " " + temp.y);
						
                        var dx:Number = x - temp.x;
                        var dy:Number = y - temp.y;
                        //calculate the angle in radians
                        var radrot:Number = Math.atan2((dy), (dx));
                
                        //trace("Rotating by" + radrot + rotOffset);
                        //rotationGoal = radrot + rotOffset;
                        temp.rotation = radrot + rotOffset;
                                        
                }
                
                private function contRotation():void {
                        
                        if (rotationGoal > temp.rotation) {
                                
                        temp.rotation = temp.rotation - rotationSpeed;
                                
                        }else temp.rotation = temp.rotation + rotationSpeed;
                        
                }
                
                private function moveTowards(x:int, y:int):void {
                        
                        destX = x;
                        destY = y;
                        var angle:Number = temp.rotation * (180 / Math.PI);
                      // trace("Angle is " + angle);
                        
                        if (angle <= 90 && angle >= 0) {
                                
                                        xMov = moveSpeed * (angle/90);
                                        yMov = moveSpeed - xMov;
                                        yMov = -yMov;
                                        
                        }else if (angle > 90 &&  angle <= 180) {
                                
                                        yMov = moveSpeed * ((angle-90)/90);
                                        xMov = moveSpeed - yMov;
                                        
                        }else if (angle <= 0 && angle >= -90) {
                                
                                        xMov = moveSpeed * (angle/-90);
                                        yMov = moveSpeed - xMov;
                                        yMov = -yMov;
                                        xMov = -xMov;
                                
                        }else if (angle < -90 &&  angle >= -180) {
                                
                                        yMov = moveSpeed * ((angle+90)/90);
                                        xMov = moveSpeed + yMov;
                                        yMov = -yMov;
                                        xMov = -xMov;
                        }

                        //trace("Moving " + xMov + " in x and  " + yMov + " in y");
                        
                }
                
                private function moveForward():void {
				
					if (!(temp.x < 64 + offset - xMov - temp.width/2 || temp.x > (41*64) + offset - xMov + temp.width/2)) {
						temp.x = temp.x + xMov;
					}
					
					if (!(temp.y >= (600-128) - (temp.height/2) - yMov || temp.y <= 96 + (temp.height/2) - yMov)) {
						temp.y = temp.y + yMov;
					}	
                }
                
                private function move():void {
                

                        skip++;
						var pt:Point = localToGlobal(new Point(temp.x, temp.y));
                        if (temp.x >= destX - 10 && temp.x <= destX + 10 && temp.y >= destY - 10 && temp.y <= destY + 10) {
							//("reach the destination at " + temp.x + " : " + temp.y);
                                destX = temp.x;
                                destY = temp.y;
								temp.stop();
                        }else {
								temp.play();
                                moveForward();
                                //contRotation();
                                if (skip >= 1) {
									//trace("destX is " + destX);
                                        turnToFace(destX, destY);
                                        moveTowards(destX, destY);
                                        skip = 0;
                                }
                                //trace("Moving");
                        }
                        
                }
				
				public override function setDestX(x:Number):void {
			
					destX = x;
			
				}
		
				public override function getDestX():Number {
			
					return destX;
                
				}
				
				public override function handleJoystick(event:GamepadEvent):void {
					
					var newPoint:Point = new Point(Gamepad.get().query(event.deviceIndex, 5), Gamepad.get().query(event.deviceIndex, 6));
					newPoint.x = newPoint.x * 75;
					newPoint.y = newPoint.y * 75;
					turnToFace(temp.x + newPoint.x, temp.y + newPoint.y);
					moveTowards(temp.x + newPoint.x, temp.y + newPoint.y);
					
				}
				
				public override function checkWin():Boolean {
					if (temp.x >= 2496 + offset) return true;
					else return false;
				}
		}

}
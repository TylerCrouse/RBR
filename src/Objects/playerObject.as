package Objects {
        import flash.geom.Point;
        import starling.display.MovieClip;
        import starling.events.Touch;

        //Placeholder because testing
        public class playerObject extends gameObject{
                
                private var temp:MovieClip;
                private var moveSpeed:Number = 2;
                
                private var xMov:Number = 0;
                private var yMov:Number = 0;
                
                private var destX:Number;
                private var destY:Number;
                
                private var rotationSpeed:Number = .1;
                private var rotationGoal:Number;
                
                private var skip:int = 0;
                private var rotOffset:Number = 1.57079633;
                
                public function playerObject() {
                        
                        temp = new MovieClip(Assets.getAtlas().getTextures("A"), 10);
                        temp.x = 250;
                        temp.y = 200;
                        destX = temp.x;
                        destY = temp.y;
                        temp.rotation = 1.57079633;
                        temp.alignPivot();
                        this.addChild(temp);
                        
                }
                
                public override function tick():void {
                        
                        //trace("Temp obj is ticking");
                        move();
                        
                }
                
                public override function handleTouch(touch:Touch):void {

                        trace("Object is handling a touch");
                        var pt:Point = new Point(touch.globalX, touch.globalY);
                        pt = localToGlobal(pt);
                        turnToFace(pt.x, pt.y);
                        moveTowards(pt.x, pt.y);
                        
                        
                }
                
                private function turnToFace(x:Number, y:Number):void {
                        
                        trace("Touched at : " + x + ", " + y);
                        trace("Object at : " + temp.x + ", " + temp.y);
                        
                        var dx:Number = x - temp.x;
                        var dy:Number = y - temp.y;
                        //calculate the angle in radians
                        var radrot:Number = Math.atan2((dy), (dx));
                
                        trace("Rotating by" + radrot + rotOffset);
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
                        trace("Angle is " + angle);
                        
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

                        trace("Moving " + xMov + " in x and  " + yMov + " in y");
                        
                }
                
                private function moveForward():void {
                        
                                temp.x= temp.x + xMov;
                                temp.y = temp.y + yMov;
                                
                }
                
                private function move():void {
                

                        skip++;
                        if (temp.x >= destX - 5 && temp.x <= destX + 5 && temp.y >= destY - 5 && temp.y <= destY + 5) {
                                destX = temp.x;
                                destY = temp.y;
                        }else {
                                moveForward();
                                //contRotation();
                                if(skip >= 50){
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
		}

}
package  {
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class soundPlayer {
		
		private var s:Sound;
		
		public function soundPlayer() {
			
			var req:URLRequest = new URLRequest("../Assets/Sounds/poppyishlikesong.MP3"); 
			s = new Sound(req); 		
			
		}
		
		public function playSound(soundName:String):void {
			
			trace("Playing sound");
			if(soundName == "menuMusic"){
			
				s.play();
			
			}
		}
		
		
	}

}
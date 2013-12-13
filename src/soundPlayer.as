package  {
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;

	public class soundPlayer {
		
		private var s:Sound;
		private var titleSong:Sound;
		private var currentSound:SoundChannel;
		
		public function soundPlayer() {
			
			var req:URLRequest = new URLRequest("../Assets/Sounds/poppyishlikesong.MP3"); 
			s = new Sound(req);
			
			var reqMenu:URLRequest = new URLRequest("../Assets/Sounds/title_music.MP3"); 
			titleSong = new Sound(reqMenu);
			
		}
		
		public function playSound(soundName:String):void {
			
			trace("Playing sound");
			if(soundName == "mainMenu"){
	
				currentSound = titleSong.play(0, 99);
			
			}
			else{
				currentSound = s.play(0,99);
			}
		}
		public function stopSound():void {
			trace ("stop sound");
			currentSound.stop();
		}
	}

}
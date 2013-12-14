package  {
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;

	public class soundPlayer {
		
		private var playSong:Sound;
		private var titleSong:Sound;
		private var winSong:Sound;
		private var currentSound:SoundChannel;
		
		public function soundPlayer() {
			
			var req:URLRequest = new URLRequest("../Assets/Sounds/game_music.MP3"); 
			playSong = new Sound(req);
			
			var reqMenu:URLRequest = new URLRequest("../Assets/Sounds/title_music.MP3"); 
			titleSong = new Sound(reqMenu);
			
			var reqWin:URLRequest = new URLRequest("../Assets/Sounds/win_level_sound.MP3"); 
			winSong = new Sound(reqWin);
			
		}
		
		public function playSound(soundName:String):void {
			
			trace("Playing sound");
			if(soundName == "mainMenu"){
	
				currentSound = titleSong.play(0, 99);
			
			}
			else if (soundName == "play") {
				
				currentSound = playSong.play(0, 99);
				
			}
			else if (soundName == "lose") {
				
			}
			else if (soundName == "win"){
			
			}
		}
		public function stopSound():void {
			trace ("stop sound");
			currentSound.stop();
		}
	}

}
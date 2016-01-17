package utils.loaders {

	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;

	public class SoundPlayer extends Sound {
	
		private var sfxmuted : Boolean = false;
		private var bgmmuted : Boolean = false;
		
		[Embed(source="../../../lib/Gong.mp3")]
		private var gongSound : Class; 		 
		private var gongmusic : Sound;
		
		[Embed(source = "../../../lib/blub.mp3")]
		private var blubSound : Class; 		 
		private var blubmusic : Sound;
		
		[Embed(source="../../../lib/zenmusic_fix.mp3")]
		private var musicSound : Class; 		 
		private var musicmusic : Sound;
		
		
		private var sfxChannel : SoundChannel;
		private var bgmChannel : SoundChannel;
		
		public function SoundPlayer() {
		
			musicmusic = (new musicSound) as Sound;
			gongmusic = (new gongSound) as Sound;
			blubmusic = (new blubSound) as Sound;
			sfxChannel = new SoundChannel();
			bgmChannel = new SoundChannel();
			bgmChannel = musicmusic.play(0, int.MAX_VALUE);
			
		}
		
		public function playSound ( name : String ) : void {
		
			if(!sfxmuted){
			
				switch(name) {
				
					case "Gong":
					
						sfxChannel = gongmusic.play();
						
					break;
					
					case "Blub":
					
						sfxChannel = blubmusic.play();
						
					break;
					
				}
				
			}
			
		}
		
		public function changeVolume ( type : String , bgmstate : Boolean , sfxstate : Boolean ) : void {
		
			switch(type) {
			
				case"sfx":
				
					if (!sfxstate) {
					
						sfxmuted = true;
						
					} else {
					
						sfxmuted = false;
						
					}
					
				break;
				
				case"bgm":
				
					if (!bgmstate) {
					
						bgmChannel.stop();
						
					} else {
					
						bgmChannel = musicmusic.play(0, int.MAX_VALUE);
						
					}
					
				break;
				
			}
			
		}

	}

}
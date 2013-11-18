package gamestate 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import utils.loaders.SoundPlayer;
	/**
	 * ...
	 * @author Kevin Breurken
	 */
	public class GamestateManager extends MovieClip
	{
		public var currentstate:MovieClip;
		public var pointstillwin:int;
		public var endless:Boolean;
		public var musicmanager:SoundPlayer;
		public var bgm:Boolean;
		public var sfx:Boolean;
		public function GamestateManager(music:SoundPlayer) 
		{
			musicmanager = music;
		}
		public function switchGamestate(name:String):void {
			trace("Change gamestate to: " + name );
			trace(pointstillwin);
			switch(name) {
				
				case "Menu":
					currentstate = new Menu(this);
				break;
				case "Game":
					currentstate = new Game(this);
				break;
				case "Credits":
					currentstate = new Credits(this);
				break;
				case "GameChoose":
					currentstate = new GameChoose(this);
				break;
				case "Options":
					currentstate = new Options(this);
				break;
			}
			addChild(currentstate);
		}
		
	}
	

}
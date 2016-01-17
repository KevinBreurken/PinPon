package gamestate {

	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	import objects.Button;

	public class GameChoose extends MovieClip {
	
		[Embed(source="../../lib/narkisim.ttf",
		fontName = "myFont", 
		mimeType = "application/x-font", 
		fontWeight="normal", 
		fontStyle="normal", 
		advancedAntiAliasing="true", 
		embedAsCFF="false")]
		
		private var myEmbeddedFont : Class;
		private var textformat : TextFormat = new TextFormat( "myFont", 50 );
		
		private var gamestatemanager : GamestateManager;
		private var modebackground : ModeScreen = new ModeScreen;
		private var endlessbutton : Button = new Button ( new EndlessButton, 550, 460 );
		private var upbutton : Button = new Button( new UpButton, 350, 400 );
		private var downbutton : Button = new Button( new DownButton, 350, 540 );
		private var startbutton : StartButton = new StartButton;
		
		private var pointstext : TextField = new TextField;
		private var isendless : Boolean;
		private var points : int = 10;
		
		private var backbutton : BackButton = new BackButton;
		
		public function GameChoose ( manager : GamestateManager ) {
		
			gamestatemanager = manager
			manager.endless = false;
			manager.pointstillwin = 10;
			addChild(modebackground);
			addChild(endlessbutton);
			addChild(downbutton);
			addChild(upbutton);
			upbutton.addEventListener(MouseEvent.CLICK, increasepoint);
			downbutton.addEventListener(MouseEvent.CLICK, decreasepoint);
			
			endlessbutton.gotoAndStop(1);
			
			addChild(pointstext);
			pointstext.defaultTextFormat = textformat;
			pointstext.embedFonts = true;
			pointstext.text = "" + points;
			pointstext.height = 40;
			pointstext.selectable = false;
			pointstext.x = 355;
			pointstext.y = 465;
			
			addChild(startbutton);
			startbutton.addEventListener(MouseEvent.CLICK, startgame);
			startbutton.x = 320;
			startbutton.y = 680;
			
			addChild(backbutton);
			backbutton.addEventListener(MouseEvent.CLICK, toMenu);
			
		}
		
		public function toMenu( e : MouseEvent ) : void {
		
			gamestatemanager.musicmanager.playSound("Gong");
			unloadContent();
			gamestatemanager.switchGamestate("Menu");
			
		}
		
		public function startgame( e : MouseEvent ) : void {
		
			gamestatemanager.musicmanager.playSound("Gong");
			gamestatemanager.endless = isendless;
			gamestatemanager.pointstillwin = points;
			
			unloadContent();
			gamestatemanager.switchGamestate("Game");
			
		}
		
		public function increasepoint( e : MouseEvent ) : void {
		
			if(points < 99){
			
				points++;
				
			}
			
			pointstext.text = ""+points;
			
		}
		
		public function decreasepoint(e:MouseEvent): void {
		
			if(points > 0){
			
			points--;
			
			}
			
			pointstext.text = ""+points;
			
		}
		
		public function unloadContent(): void {
		
			removeChild(modebackground);
			removeChild(endlessbutton);
			removeChild(upbutton);
			removeChild(downbutton);
			removeChild(pointstext);
			removeChild(startbutton);
			
		}
		
	}

}
package utils.draw 
{
	import adobe.utils.ProductManager;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import utils.draw.Squar;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Button extends Sprite 
	{
		public var art:Squar;
		public var text:TextField;
		private var _clicked:Boolean = false;
		private var _centered:Boolean;
		private var _height:Number;
		private var _width:Number;
		private var _colourInactive:uint;
		private var _colourActive:uint;
		private var _xoff:Number = 0;
		private var _yoff:Number = 0;
		
		/**
		 * Function make a Simple clickble button
		 *
		 * @example example:
		 * @param $height : Set height of bounding box
		 * @param $width : Set width of bouding box
		 * @param $x : Set location on the x axis
		 * @param $y : Set location on the y axis
		 * @param $colourActive : Set boudning box colour
		 * @param $colourInactive : Set boudning box colour
		 * @param $text : Set Text it will display
		 * @param $fontsize : Set the size of the font
		 * @param $textColour : Set colour of the text
		 * @param $centered : Use center of object
		 * @param $font : set the font of the text
		 * @param $clickble : if you can click on it
		 * @param $Alpha : Set alpha of square
		 * @return 
		 */
		
		public function Button($height:Number, $width:Number, $x:Number, $y:Number, $colourActive:uint,$colourInactive:uint, $text:String = "", $fontsize:Number = 12, $textcolour:uint = 0x000000, $centered:Boolean = false, $font:String = "Arial", $clickble:Boolean = true, $Alpha:Number=1) 
		{
			
			this.x = $x;
			this.y = $y;
			
			
			text = new TextField();
			text.defaultTextFormat = new TextFormat($font, $fontsize, $textcolour);
			text.text = $text
			text.width = text.textWidth+5;
			text.height = text.textHeight+3;
			text.selectable = false;
			if($clickble){addEventListener(MouseEvent.CLICK, mouseClick);}
			
			if ($height == 0 && $width == 0)
			{
				$height = text.textHeight + 5;
				$width = text.textWidth + 5;
			}
			if ($centered)
			{
				_xoff = -$width / 2;
				_yoff = -$height / 2
			}  
			text.x = _xoff;
			text.y = _yoff;
			art = new Squar(_xoff , _yoff, $height, $width, $colourInactive);
			art.alpha = $Alpha;
			
			//some var's where edited so I put them into privated var's here
			_colourActive = $colourActive;
			_colourInactive = $colourInactive;
			_height = $height;
			_width = $width;
			_centered = $centered
			
			addChild(art);
			addChild(text);
		}
		
		private function mouseClick(e:MouseEvent):void 
		{
			_clicked = !_clicked;
			draw();
			
		}
		
		private function draw() : void
		{
			if (_clicked)
			{
				removeChild(text);
				removeChild(art);
				art = new Squar(_xoff , _yoff, _height, _width, _colourActive);
				addChild(art);
				addChild(text);
			}
			else
			{
				removeChild(text);
				removeChild(art);
				art = new Squar(_xoff , _yoff, _height, _width, _colourInactive);
				addChild(art);
				addChild(text);
			}
		}
		
		public function get clicked():Boolean 
		{
			
			return _clicked;
		}
		
		public function set clicked(value:Boolean):void 
		{
			_clicked = value;
			draw();
		}
	}

}
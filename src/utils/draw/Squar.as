package utils.draw
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Squar extends Sprite
	{
		public var kleur:uint;
		public var $height:Number;
		public var $width:Number;
		public var sleepbaar:Boolean;
		public var linewidth:Number;
		public var tag:String;
		
		public function Squar($x:Number, $y:Number, $height:Number, $width:Number, kleur:uint,linewidth:Number=0,tag:String=""):void
		{
		this.sleepbaar = sleepbaar;
		this.$height = $height;
		this.$width = $width;
		this.kleur = kleur;
		this.x = $x;
		this.y = $y;
		this.linewidth = linewidth;
		this.tag = tag
		
		if (this.linewidth != 0){this.graphics.lineStyle(this.linewidth);}
		this.graphics.beginFill(this.kleur);
		this.graphics.drawRect(0, 0, this.$width, this.$height);
		}
	}

}
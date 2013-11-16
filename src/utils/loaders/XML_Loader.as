package  utils.loaders
{
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URL_loader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author ...
	 */
	public class XML_loader extends Sprite
	{
		public var loaded:XML;
		private var _loader:URL_loader
		private var _dispatchMessage:String
		public function XML_loader(url:String, $dispatchMessage:String="") 
		{
			dispatchMessage=$dispatchMessage
			_loader = new URL_loader (new URLRequest(url));
			_loader.addEventListener(Event.COMPLETE, onXMLLoad, false, 0, true);
		}
		
		private function onXMLLoad(e:Event):void 
		{
			loaded = XML(e.target.data);
			
			if (_dispatchMessage != "")
			{
				dispatchEvent(new Event(_dispatchMessage));
			}
		}
	}
}
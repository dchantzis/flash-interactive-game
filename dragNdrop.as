package
{
	import flash.filters.DropShadowFilter;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class dragNdrop extends MovieClip
	{
		public var _targetPiece:*;
		
		//constructor
		public function dragNdrop(){enable();}//constructors
		
		private function drag(event:MouseEvent):void
		{
			this.startDrag();
			this.filters = [new DropShadowFilter()];
			this.parent.addChild(this);
			this.alpha = 1;
		}//dragMovie(event:MouseEvent):void
		private function drop(event:MouseEvent):void
		{
			this.stopDrag(); 
			this.filters = []; 
			this.alpha = .75;
		}//dropMovie(event:MouseEvent):void
		public function enable():void
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			this.addEventListener(MouseEvent.MOUSE_UP, drop); 
			this.buttonMode = true;
		}//enable():void
		public function disable():void
		{
			this.buttonMode = false;
			this.removeEventListener(MouseEvent.MOUSE_DOWN, drag);
			this.removeEventListener(MouseEvent.MOUSE_UP, drop);
		}//disable():void
	}
}//package
package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Act109 extends Sprite
	{
		private var _shape:Sprite = null;
		private var colorToggle:Boolean = false;
		private const colorA:uint = 0xFF00FF;
		private const colorB:uint = 0xFF8000;
		
		public function Act109()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			trace('application initialized.');
			removeEventListener(Event.ADDED_TO_STAGE,init);
			stage.color = 0x000000;
			drawRect(0x00FF00);
		}

		private function drawRect(color:uint):void
		{
			_shape = new Sprite();
			changeColor();
			_shape.addEventListener(MouseEvent.CLICK, onChangeColor);
			_shape.x = (stage.stageWidth - _shape.width) / 2;
			_shape.y = (stage.stageHeight - _shape.height) / 2;
			addChild(_shape);
		}
		
		private function onChangeColor(event:Event):void
		{
			changeColor();
		}

		private function changeColor():void
		{
			var color:uint = 0x000000;
			if (colorToggle)
				color = colorA;
			else
				color = colorB;

			_shape.graphics.clear();
			_shape.graphics.beginFill(color);
			_shape.graphics.drawRect(0,0,100,100);
			_shape.graphics.endFill();
			trace('color changed !! ' + color);
			
			colorToggle = (colorToggle) ? false : true;
			
		}
		
	}
}
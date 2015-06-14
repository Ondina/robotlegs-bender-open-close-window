package yourdomain.commons.controllers.events
{
	import flash.events.Event;

	public class SparkWindowEvent extends Event
	{
		public static const OPEN_SAME_CONTEXT_WINDOW:String = "openSameContextWindow";
		public static const CLOSE_SAME_CONTEXT_WINDOW:String = "closeSameContextWindow";

		//variant A
		public static const OPEN_MODULAR_WINDOW_A:String = "openModularWindow_A";
		public static const CLOSE_MODULAR_WINDOW_A:String = "closeModularWindow_A";

		//variant B
		public static const OPEN_MODULAR_WINDOW_B:String = "openModularWindow_B";
		public static const CLOSE_MODULAR_WINDOW_B:String = "closeModularWindow_B";

		public function SparkWindowEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new SparkWindowEvent(type, bubbles, cancelable);
		}
	}
}

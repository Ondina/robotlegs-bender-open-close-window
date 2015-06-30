package yourdomain.commons.controllers.events
{
	import flash.events.Event;

	public class SparkWindowEvent extends Event
	{
		//SAME CONTEXT VARIANT A
		public static const OPEN_SAME_CONTEXT_WINDOW_A:String = "openSameContextWindow_A";
		public static const CLOSE_SAME_CONTEXT_WINDOW_A:String = "closeSameContextWindow_A";
		
		//SAME CONTEXT VARIANT B
		public static const OPEN_SAME_CONTEXT_WINDOW_B:String = "openSameContextWindow_B";
		public static const CLOSE_SAME_CONTEXT_WINDOW_B:String = "closeSameContextWindow_B";

		//MODULAR VARIANT A
		public static const OPEN_MODULAR_WINDOW_A:String = "openModularWindow_A";
		public static const CLOSE_MODULAR_WINDOW_A:String = "closeModularWindow_A";
		
		//MODULAR VARIANT B
		public static const OPEN_MODULAR_WINDOW_B:String = "openModularWindow_B";
		public static const CLOSE_MODULAR_WINDOW_B:String = "closeModularWindow_B";
		
		//MODULAR VARIANT C
		public static const OPEN_MODULAR_WINDOW_C:String = "openModularWindow_C";
		public static const CLOSE_MODULAR_WINDOW_C:String = "closeModularWindow_C";
		
		//MODULAR VARIANT D
		public static const OPEN_MODULAR_WINDOW_D:String = "openModularWindow_D";
		public static const CLOSE_MODULAR_WINDOW_D:String = "closeModularWindow_D";
		
		//CLOSE ALL
		public static const CLOSE_ALL_WINDOWS:String = "closeAllWindows";
		
		//
		public static const OPEN_ONE_WINDOW:String = "openOneWindow";
		public static const CLOSE_ONE_WINDOW:String = "closeOneWindow";

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

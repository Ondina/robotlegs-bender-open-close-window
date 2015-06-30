package yourdomain.shell.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.commons.views.components.SomeSimpleView;
	import yourdomain.modules.extendedWindows.views.components.base.api.IBaseWindowComponent;
	import yourdomain.modules.extendedWindows.views.components.DerivedWindow_A;
	import yourdomain.modules.extendedWindows.views.components.DerivedWindow_B;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_A;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_B;
	import yourdomain.shell.views.components.ShellWindowOpenerView;

	public class ShellWindowOpenerMediator extends Mediator
	{
		[Inject]
		public var view:ShellWindowOpenerView;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//open a mediated spark window in this context - VARIANT A
			addViewListener(SparkWindowEvent.OPEN_SAME_CONTEXT_WINDOW_A, onOpenSameContextWindow_A, SparkWindowEvent);
			//redisptaching view's event; SomeWindowMediator_A will react to it
			addViewListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW_A, dispatch, SparkWindowEvent);

			//open a mediated spark window in this context - VARIANT B
			addViewListener(SparkWindowEvent.OPEN_SAME_CONTEXT_WINDOW_B, onOpenSameContextWindow_B, SparkWindowEvent);
			//redisptaching view's event; SomeWindowMediator_B will react to it
			addViewListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW_B, dispatch, SparkWindowEvent);

			//open a mediated spark window in this context - VARIANT C
			// the windows and mediators are extending a base class
			addViewListener(SparkWindowEvent.OPEN_ONE_WINDOW, onOpenMultipleWindows, SparkWindowEvent);
			addViewListener(SparkWindowEvent.CLOSE_ONE_WINDOW, dispatch, SparkWindowEvent);
		}

		//============================================================================
		// OPEN MEDIATED WINDOW IN THIS CONTEXT - VARIANT A
		//============================================================================
		private function onOpenSameContextWindow_A(event:SparkWindowEvent):void
		{
			var someWindow:SameContextWindow_A = new SameContextWindow_A();

			viewManager.addContainer(someWindow);

			var someSimpleView:SomeSimpleView = new SomeSimpleView();
			someSimpleView.y = 50;
			someWindow.addElement(someSimpleView);

			someWindow.open();
		}

		//============================================================================
		// OPEN MEDIATED WINDOW IN THIS CONTEXT - VARIANT B
		//============================================================================
		private function onOpenSameContextWindow_B(event:SparkWindowEvent):void
		{
			var someWindow:SameContextWindow_B = new SameContextWindow_B();

			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		//============================================================================
		// OPEN 2 EXTENDED WINDOWS
		//============================================================================
		private function onOpenMultipleWindows(event:SparkWindowEvent):void
		{
			var derivedWindow_A:DerivedWindow_A = new DerivedWindow_A();
			viewManager.addContainer(derivedWindow_A);
			derivedWindow_A.open();
			
			var derivedWindow_B:DerivedWindow_B = new DerivedWindow_B();
			viewManager.addContainer(derivedWindow_B);
			derivedWindow_B.open();
		}
	}
}

package yourdomain.shell.views.mediators
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.commons.views.components.SomeSimpleView;
	import yourdomain.modules.modularWindow_A.views.components.ModularWindow_A;
	import yourdomain.modules.modularWindow_B.views.components.ModularWindow_B;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow;
	import yourdomain.shell.views.components.WindowOpenerView;

	public class WindowOpenerMediator extends Mediator
	{
		[Inject]
		public var view:WindowOpenerView;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//open a mediated spark window in this context
			addViewListener(SparkWindowEvent.OPEN_SAME_CONTEXT_WINDOW, onOpenSameContextWindow, SparkWindowEvent);
			//redisptaching view's event; SomeWindowMediator will react to it
			addViewListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW, dispatch, SparkWindowEvent);

			//open a spark window with its own context
			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_A, onOpenModularWindow_A, SparkWindowEvent);
			//shell to module event; ModularWindowMediator will react to it
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_A, onCloseModularWindow, SparkWindowEvent);

			//open a spark window with its own context
			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_B, onOpenModularWindow_B, SparkWindowEvent);
			//shell to module event; ModularWindowMediator will react to it
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_B, onCloseModularWindow, SparkWindowEvent);
		}

		//============================================================================
		// MEDIATED WINDOW IN THIS CONTEXT
		//============================================================================
		private function onOpenSameContextWindow(event:SparkWindowEvent):void
		{
			var someWindow:SameContextWindow = new SameContextWindow();

			viewManager.addContainer(someWindow);

			var someSimpleView:SomeSimpleView = new SomeSimpleView();
			someSimpleView.y = 50;
			someWindow.addElement(someSimpleView);

			someWindow.open();
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT A
		//============================================================================
		private function onOpenModularWindow_A(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_A = new ModularWindow_A();
			someWindow.addEventListener(Event.CLOSE, onModularWindow_A_Closed);
			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		protected function onModularWindow_A_Closed(event:Event):void
		{
			viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);
			if (event.currentTarget.stage)
				event.currentTarget.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT B
		//============================================================================
		private function onOpenModularWindow_B(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_B = new ModularWindow_B();
			someWindow.addEventListener(Event.REMOVED_FROM_STAGE, onModularWindow_B_RemovedFromStage);

			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		protected function onModularWindow_B_RemovedFromStage(event:Event):void
		{
			viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);

		}

		private function onCloseModularWindow(event:SparkWindowEvent):void
		{
			dispatch(event);
		}
	}
}

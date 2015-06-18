package yourdomain.shell.views.mediators
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.modularWindow_A.views.components.ModularWindow_A;
	import yourdomain.modules.modularWindow_B.views.components.ModularWindow_B;
	import yourdomain.modules.modularWindow_C.views.components.ModularWindow_C;
	import yourdomain.modules.modularWindow_D.views.components.ModularWindow_D;
	import yourdomain.shell.views.components.ModularWindowOpenerView;

	public class ModularWindowOpenerMediator extends Mediator
	{
		[Inject]
		public var view:ModularWindowOpenerView;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_A, onOpenModularWindow_A, SparkWindowEvent);
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_A, dispatch, SparkWindowEvent);

			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_B, onOpenModularWindow_B, SparkWindowEvent);
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_B, dispatch, SparkWindowEvent);

			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_C, onOpenModularWindow_C, SparkWindowEvent);
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_C, dispatch, SparkWindowEvent);

			addViewListener(SparkWindowEvent.OPEN_MODULAR_WINDOW_D, onOpenModularWindow_D, SparkWindowEvent);
			addViewListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_D, dispatch, SparkWindowEvent);
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT A - open ModularWindow_A
		//============================================================================
		private function onOpenModularWindow_A(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_A = new ModularWindow_A();
			someWindow.addEventListener(Event.CLOSE, onModularWindow_A_Closed);
			
			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT A - Event.CLOSE handler
		//============================================================================
		protected function onModularWindow_A_Closed(event:Event):void
		{
			viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);
			
			if (event.currentTarget.stage)
				event.currentTarget.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT B - ModularWindow_B
		//============================================================================
		private function onOpenModularWindow_B(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_B = new ModularWindow_B();
			someWindow.addEventListener(Event.REMOVED_FROM_STAGE, onModularWindow_B_RemovedFromStage);

			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT B - Event.REMOVED_FROM_STAGE handler
		//============================================================================
		protected function onModularWindow_B_RemovedFromStage(event:Event):void
		{
			viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT C - ModularWindow_C
		//============================================================================
		private function onOpenModularWindow_C(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_C = new ModularWindow_C();

			viewManager.addContainer(someWindow);

			someWindow.open();
		}

		//============================================================================
		// MODULAR WINDOW - VARIANT D - ModularWindow_D
		//============================================================================
		private function onOpenModularWindow_D(event:SparkWindowEvent):void
		{
			var someWindow:ModularWindow_D = new ModularWindow_D();

			viewManager.addContainer(someWindow);

			someWindow.open();
		}
	}
}

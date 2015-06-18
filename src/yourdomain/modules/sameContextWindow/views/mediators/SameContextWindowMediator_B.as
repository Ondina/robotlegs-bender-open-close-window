package yourdomain.modules.sameContextWindow.views.mediators
{
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_B;

	public class SameContextWindowMediator_B extends Mediator
	{
		[Inject]
		public var view:SameContextWindow_B;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//listener for the event dispatched by WindowOpenerMediator
			addContextListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW_B, onCloseSparkWindow, SparkWindowEvent);
			addContextListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, onCloseSparkWindow, SparkWindowEvent);
		}

		private function onCloseSparkWindow(event:SparkWindowEvent):void
		{
			destroyView();
		}

		private function destroyView():void
		{
			// remove any reference that could keep the view alive
			view.cleanUp();

			//close the window
			view.close();
		}

		override public function destroy():void
		{
			viewManager.removeContainer(view);
			super.destroy();
		}
	}
}

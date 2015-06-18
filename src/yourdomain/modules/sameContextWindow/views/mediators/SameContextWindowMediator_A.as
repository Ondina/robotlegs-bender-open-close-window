package yourdomain.modules.sameContextWindow.views.mediators
{
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_A;

	public class SameContextWindowMediator_A extends Mediator
	{
		[Inject]
		public var view:SameContextWindow_A;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//listener for the event dispatched by ShellWindowOpenerMediator
			addContextListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW_A, onCloseSparkWindow, SparkWindowEvent);
			addContextListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, onCloseSparkWindow, SparkWindowEvent);
		}		

		private function onCloseSparkWindow(event:SparkWindowEvent):void
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

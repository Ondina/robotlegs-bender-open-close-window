package yourdomain.modules.sameContextWindow.views.mediators
{
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow;

	public class SameContextWindowMediator extends Mediator
	{
		[Inject]
		public var view:SameContextWindow;

		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//listener for the event dispatched by WindowOpenerMediator
			addContextListener(SparkWindowEvent.CLOSE_SAME_CONTEXT_WINDOW, onCloseSparkWindow, SparkWindowEvent);
		}

		private function onWindowClosing(event:Event):void
		{
			event.preventDefault();
			event.currentTarget.removeEventListener(Event.CLOSING, onWindowClosing);

			destroyView();
		}

		private function onCloseSparkWindow(event:SparkWindowEvent):void
		{
			view.close();
		}

		private function destroyView():void
		{
			// remove any reference that could keep the view alive
			view.cleanUp();

			//close the window
			view.close();

			//remove it from the viewManager
			viewManager.removeContainer(view);

			view = null;
		}

		override public function destroy():void
		{
			viewManager.removeContainer(view);
			super.destroy();
		}
	}
}

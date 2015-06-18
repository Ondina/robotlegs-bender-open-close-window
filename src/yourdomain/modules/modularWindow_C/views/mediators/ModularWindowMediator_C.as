package yourdomain.modules.modularWindow_C.views.mediators
{
	import flash.events.Event;

	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.modularWindow_C.views.components.ModularWindow_C;

	public class ModularWindowMediator_C extends Mediator
	{
		[Inject]
		public var view:ModularWindow_C;

		[Inject(name = "shellViewManager")]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			addViewListener(Event.CLOSING, onWindowClosing, Event);

			//listener for the event dispatched by ModularWindowOpenerMediator from the parent Context
			addContextListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_C, onCloseWindowFromParentContext, SparkWindowEvent);
			addContextListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, onCloseWindowFromParentContext, SparkWindowEvent);
		}

		private function onWindowClosing(event:Event):void
		{
			event.preventDefault();
			event.currentTarget.removeEventListener(Event.CLOSING, onWindowClosing);

			destroyView();
		}

		private function onCloseWindowFromParentContext(event:SparkWindowEvent):void
		{
			destroyView();
		}

		private function destroyView():void
		{
			view.cleanUp();
			view.close();
		}

		override public function destroy():void
		{
			viewManager.removeContainer(view);
			super.destroy();
		}
	}
}

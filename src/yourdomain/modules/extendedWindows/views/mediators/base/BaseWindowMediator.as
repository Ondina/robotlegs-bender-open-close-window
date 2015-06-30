package yourdomain.modules.extendedWindows.views.mediators.base
{
	import flash.display.DisplayObjectContainer;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.extendedWindows.views.components.base.api.IBaseWindowComponent;

	public class BaseWindowMediator extends Mediator
	{
		[Inject]
		public var view:IBaseWindowComponent;
		
		[Inject]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			addContextListener(SparkWindowEvent.CLOSE_ONE_WINDOW, onCloseSparkWindow, SparkWindowEvent);
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
			viewManager.removeContainer(view as DisplayObjectContainer);
			super.destroy();
		}
	}
}

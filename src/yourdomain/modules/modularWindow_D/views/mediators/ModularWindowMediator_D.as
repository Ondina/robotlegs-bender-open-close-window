package yourdomain.modules.modularWindow_D.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.modularWindow_D.views.components.ModularWindow_D;

	public class ModularWindowMediator_D extends Mediator
	{
		[Inject]
		public var view:ModularWindow_D;

		[Inject(name = "shellViewManager")]
		public var viewManager:IViewManager;

		override public function initialize():void
		{
			//listener for the event dispatched by ModularWindowOpenerMediator from the parent Context
			addContextListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_D, onCloseWindowFromParentContext, SparkWindowEvent);
			addContextListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, onCloseWindowFromParentContext, SparkWindowEvent);
		}

		private function onCloseWindowFromParentContext(event:SparkWindowEvent):void
		{
			view.close();
		}

		override public function destroy():void
		{
			viewManager.removeContainer(view);
			super.destroy();
		}
	}
}

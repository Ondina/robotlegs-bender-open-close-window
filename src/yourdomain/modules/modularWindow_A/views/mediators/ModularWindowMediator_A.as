package yourdomain.modules.modularWindow_A.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.modularWindow_A.views.components.ModularWindow_A;

	public class ModularWindowMediator_A extends Mediator
	{
		[Inject]
		public var view:ModularWindow_A;

		override public function initialize():void
		{
			//listener for the event dispatched by WindowOpenerMediator from the parent Context
			addContextListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_A, onCloseWindowFromParent, SparkWindowEvent);
		}

		private function onCloseWindowFromParent(event:SparkWindowEvent):void
		{
			view.close();
		}
	}
}

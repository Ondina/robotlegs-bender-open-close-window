package yourdomain.modules.modularWindow_B.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import yourdomain.commons.controllers.events.SparkWindowEvent;
	import yourdomain.modules.modularWindow_B.views.components.ModularWindow_B;

	public class ModularWindowMediator_B extends Mediator
	{
		[Inject]
		public var view:ModularWindow_B;

		override public function initialize():void
		{
			//listener for the event dispatched by WindowOpenerMediator from the parent Context
			addContextListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_B, onCloseWindowFromParent, SparkWindowEvent);
		}

		private function onCloseWindowFromParent(event:SparkWindowEvent):void
		{
			view.close();
		}
	}
}

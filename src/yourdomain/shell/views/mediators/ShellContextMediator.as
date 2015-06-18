package yourdomain.shell.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;

	import yourdomain.commons.controllers.events.SparkWindowEvent;

	public class ShellContextMediator extends Mediator
	{
		[Inject]
		public var view:ShellContextView;

		override public function initialize():void
		{
			//redispatching the event from view to all interested mediators
			addViewListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, dispatch, SparkWindowEvent);
		}
	}
}

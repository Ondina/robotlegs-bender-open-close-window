package yourdomain.commons.views.mediators
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import yourdomain.commons.views.components.SomeSimpleView;

	public class SomeSimpleMediator extends Mediator
	{
		[Inject]
		public var view:SomeSimpleView;

		override public function initialize():void
		{
			view.setLabeltext("message from SomeSimpleMediator");
		}
	}
}

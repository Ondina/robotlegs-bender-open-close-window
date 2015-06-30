package yourdomain.modules.extendedWindows.views.mediators
{
	import yourdomain.modules.extendedWindows.views.mediators.base.BaseWindowMediator;

	public class DerivedWindowMediator_A extends BaseWindowMediator
	{
		override public function initialize():void
		{
			super.initialize();
			view.windowTitle = "A derived window A";
		}
	}
}
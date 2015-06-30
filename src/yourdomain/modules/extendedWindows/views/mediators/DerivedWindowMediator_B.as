package yourdomain.modules.extendedWindows.views.mediators
{
	import yourdomain.modules.extendedWindows.views.components.base.api.IDrawRectangles;
	import yourdomain.modules.extendedWindows.views.mediators.base.BaseWindowMediator;

	public class DerivedWindowMediator_B extends BaseWindowMediator
	{
		//the additional interface of DerivedWindow_B:
		[Inject]
		public var drawingView:IDrawRectangles;
		
		override public function initialize():void
		{
			super.initialize();
			
			drawingView.drawRectangles();
		}
	}
}
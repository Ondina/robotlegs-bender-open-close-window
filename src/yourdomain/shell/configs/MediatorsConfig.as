package yourdomain.shell.configs
{
	import robotlegs.bender.extensions.matching.TypeMatcher;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import yourdomain.commons.views.components.SomeSimpleView;
	import yourdomain.commons.views.mediators.SomeSimpleMediator;
	import yourdomain.modules.extendedWindows.views.components.base.api.IBaseWindowComponent;
	import yourdomain.modules.extendedWindows.views.components.base.api.IDrawRectangles;
	import yourdomain.modules.extendedWindows.views.components.DerivedWindow_A;
	import yourdomain.modules.extendedWindows.views.components.DerivedWindow_B;
	import yourdomain.modules.extendedWindows.views.mediators.DerivedWindowMediator_A;
	import yourdomain.modules.extendedWindows.views.mediators.DerivedWindowMediator_B;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_A;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow_B;
	import yourdomain.modules.sameContextWindow.views.mediators.SameContextWindowMediator_A;
	import yourdomain.modules.sameContextWindow.views.mediators.SameContextWindowMediator_B;
	import yourdomain.shell.views.components.ModularWindowOpenerView;
	import yourdomain.shell.views.components.ShellWindowOpenerView;
	import yourdomain.shell.views.mediators.ModularWindowOpenerMediator;
	import yourdomain.shell.views.mediators.ShellContextMediator;
	import yourdomain.shell.views.mediators.ShellWindowOpenerMediator;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var injector:IInjector;


		public function configure():void
		{
			mediatorMap.map(SomeSimpleView).toMediator(SomeSimpleMediator);

			//views extending BaseWindowComponent, mediators extending BaseWindowMediator
			//DerivedWindow_A implements IBaseWindowComponent
			mediatorMap.mapMatcher(new TypeMatcher()
				.allOf(IBaseWindowComponent, DerivedWindow_A))
				.toMediator(DerivedWindowMediator_A);
			
			//DerivedWindow_B implements IBaseWindowComponent and IDrawRectangles
			mediatorMap.mapMatcher(new TypeMatcher()
				.allOf(IBaseWindowComponent, IDrawRectangles, DerivedWindow_B))
				.toMediator(DerivedWindowMediator_B);

			mediatorMap.map(SameContextWindow_A).toMediator(SameContextWindowMediator_A);
			mediatorMap.map(SameContextWindow_B).toMediator(SameContextWindowMediator_B);

			mediatorMap.map(ShellWindowOpenerView).toMediator(ShellWindowOpenerMediator);
			mediatorMap.map(ModularWindowOpenerView).toMediator(ModularWindowOpenerMediator);

			mediatorMap.map(ShellContextView).toMediator(ShellContextMediator);

			//mapping the viewmanager to be used in Module D and C
			injector.map(IViewManager, "shellViewManager").toValue(injector.getInstance(IViewManager));
		}
	}
}

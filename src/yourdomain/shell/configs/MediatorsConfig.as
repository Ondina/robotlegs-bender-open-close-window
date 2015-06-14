package yourdomain.shell.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.commons.views.components.SomeSimpleView;
	import yourdomain.commons.views.mediators.SomeSimpleMediator;
	import yourdomain.modules.sameContextWindow.views.components.SameContextWindow;
	import yourdomain.modules.sameContextWindow.views.mediators.SameContextWindowMediator;
	import yourdomain.shell.views.components.WindowOpenerView;
	import yourdomain.shell.views.mediators.WindowOpenerMediator;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
			mediatorMap.map(SomeSimpleView).toMediator(SomeSimpleMediator);
			mediatorMap.map(SameContextWindow).toMediator(SameContextWindowMediator);

			mediatorMap.map(WindowOpenerView).toMediator(WindowOpenerMediator);
		}
	}
}

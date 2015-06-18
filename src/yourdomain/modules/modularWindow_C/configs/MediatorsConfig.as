package yourdomain.modules.modularWindow_C.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.modules.modularWindow_C.views.components.ModularWindow_C;
	import yourdomain.modules.modularWindow_C.views.mediators.ModularWindowMediator_C;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
			mediatorMap.map(ModularWindow_C).toMediator(ModularWindowMediator_C);
		}
	}
}

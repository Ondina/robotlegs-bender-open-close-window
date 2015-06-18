package yourdomain.modules.modularWindow_A.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.modules.modularWindow_A.views.components.ModularWindow_A;
	import yourdomain.modules.modularWindow_A.views.mediators.ModularWindowMediator_A;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
			mediatorMap.map(ModularWindow_A).toMediator(ModularWindowMediator_A);
		}
	}
}

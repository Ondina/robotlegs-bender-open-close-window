package yourdomain.modules.modularWindow_B.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.modules.modularWindow_B.views.components.ModularWindow_B;
	import yourdomain.modules.modularWindow_B.views.mediators.ModularWindowMediator_B;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
			mediatorMap.map(ModularWindow_B).toMediator(ModularWindowMediator_B);
		}
	}
}

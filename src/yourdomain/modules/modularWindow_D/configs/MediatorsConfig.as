package yourdomain.modules.modularWindow_D.configs
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.modules.modularWindow_D.views.components.ModularWindow_D;
	import yourdomain.modules.modularWindow_D.views.mediators.ModularWindowMediator_D;

	public class MediatorsConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void
		{
			mediatorMap.map(ModularWindow_D).toMediator(ModularWindowMediator_D);
		}
	}
}

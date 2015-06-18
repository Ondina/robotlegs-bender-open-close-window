package yourdomain.modules.modularWindow_D.configs
{
	import robotlegs.bender.extensions.modularity.api.IModuleConnector;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.commons.controllers.events.SparkWindowEvent;

	public class ModuleConnectorConfig_D implements IConfig
	{
		[Inject]
		public var moduleConnector:IModuleConnector;

		public function configure():void
		{
			//============================================================================
			// MODULE LISTENS onDefaultChannel for Shell's event
			//============================================================================
			moduleConnector.onChannel("MODULE_D")
				.receiveEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_D)
				.receiveEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);
		}
	}
}

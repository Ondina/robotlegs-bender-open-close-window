package yourdomain.modules.modularWindow_C.configs
{
	import robotlegs.bender.extensions.modularity.api.IModuleConnector;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.commons.controllers.events.SparkWindowEvent;

	public class ModuleConnectorConfig_C implements IConfig
	{
		[Inject]
		public var moduleConnector:IModuleConnector;

		public function configure():void
		{
			//============================================================================
			// MODULE LISTENS onDefaultChannel for Shell's event
			//============================================================================
			moduleConnector.onChannel("MODULE_C")
				.receiveEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_C)
				.receiveEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);
		}
	}
}

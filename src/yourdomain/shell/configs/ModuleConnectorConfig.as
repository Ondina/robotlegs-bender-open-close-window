package yourdomain.shell.configs
{
	import robotlegs.bender.extensions.modularity.api.IModuleConnector;
	import robotlegs.bender.framework.api.IConfig;

	import yourdomain.commons.controllers.events.SparkWindowEvent;

	public class ModuleConnectorConfig implements IConfig
	{
		[Inject]
		public var moduleConnector:IModuleConnector;

		public function configure():void
		{
			//============================================================================
			// SHELL TO MODULES CHANNEL
			//============================================================================
			moduleConnector.onChannel("MODULE_A")
				.relayEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_A)
				.relayEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);

			moduleConnector.onChannel("MODULE_B")
				.relayEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_B)
				.relayEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);

			moduleConnector.onChannel("MODULE_C")
				.relayEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_C)
				.relayEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);

			moduleConnector.onChannel("MODULE_D")
				.relayEvent(SparkWindowEvent.CLOSE_MODULAR_WINDOW_D)
				.relayEvent(SparkWindowEvent.CLOSE_ALL_WINDOWS);
		}
	}
}

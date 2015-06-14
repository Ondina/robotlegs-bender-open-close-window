package yourdomain.modules.modularWindow_B.configs
{
	import flash.display.DisplayObjectContainer;

	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	public class ModularWindowContext_B
	{
		private var context:IContext;

		//============================================================================
		// docs: https://github.com/robotlegs/robotlegs-framework/blob/master/src/robotlegs/bender/framework/readme-context.md
		// The "contextView" should always be provided as the final configuration as it may trigger context initialization.
		//============================================================================
		public function ModularWindowContext_B(view:DisplayObjectContainer)
		{
			context = new Context()
				.install(MVCSBundle)
				.configure(ModuleConnectorConfig_B, MediatorsConfig)
				.configure(new ContextView(view));
		}

	}
}

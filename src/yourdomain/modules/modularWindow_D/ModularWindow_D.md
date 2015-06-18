###ModularWindow_D
removes itself from the WindowedSystemManager
	protected function window_closeHandler(event:Event):void
	{
		cleanUp();
		if (stage)
			owner.removeChild(this);//owner=WindowedSystemManager
	}

The viewManager has been mapped in the shell context like this:

    injector.map(IViewManager, "shellViewManager").toValue(injector.getInstance(IViewManager));
    
and then injected into module's mediator like so:
    
    [Inject (name = "shellViewManager")]
    public var viewManager:IViewManager;

The window is removed from the viewManager like so:

	override public function destroy():void
	{
		viewManager.removeContainer(view);
		super.destroy();
	}
###ModularWindowMediator_C
is adding an event listener for the Event.CLOSING dispatched by the window before closing:

    override public function initialize():void
    {
    	addViewListener(Event.CLOSING, onWindowClosing, Event);
     		
    	addContextListener(SparkWindowEvent.CLOSE_MODULAR_WINDOW_C, onCloseWindowFromParentContext, SparkWindowEvent);
    	addContextListener(SparkWindowEvent.CLOSE_ALL_WINDOWS, onCloseWindowFromParentContext, SparkWindowEvent);
    }

in the handler of that event it closes the window:

    private function onWindowClosing(event:Event):void
    {
    	event.preventDefault();
    	event.currentTarget.removeEventListener(Event.CLOSING, onWindowClosing);
    
    	destroyView();
    }
    private function destroyView():void
    {
    	view.cleanUp();
    	view.close();
    }

and here it removes the window from the viewManager of the parent context:

    override public function destroy():void
    {
    	viewManager.removeContainer(view);
    	super.destroy();
    }


The viewManager has been mapped in the shell context like this:

    injector.map(IViewManager, "shellViewManager").toValue(injector.getInstance(IViewManager));
    
and then injected into module's mediator like so:
    
    [Inject (name = "shellViewManager")]
    public var viewManager:IViewManager;

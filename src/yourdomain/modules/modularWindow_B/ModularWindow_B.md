###ModularWindow_B
dispatches the event REMOVED_FROM_STAGE in the handler of the Event.CLOSE

    protected function window_closeHandler(event:Event):void
    {
    	if (stage)
    	{
    		dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
    	}
    }

###ModularWindowOpenerMediator 
has added an event listener for the event REMOVED_FROM_STAGE before opening the window

    private function onOpenModularWindow_B(event:SparkWindowEvent):void
    {
    	var someWindow:ModularWindow_B = new ModularWindow_B();
    	someWindow.addEventListener(Event.REMOVED_FROM_STAGE, onModularWindow_B_RemovedFromStage);
    
    	viewManager.addContainer(someWindow);
    
    	someWindow.open();
    }

in the handler of the event, ModularWindowOpenerMediator removes the window from the viewManager

    protected function onModularWindow_B_RemovedFromStage(event:Event):void
    {
    	viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);
    }

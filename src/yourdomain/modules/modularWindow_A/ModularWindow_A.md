###ModularWindow_A

ModularWindowOpenerMediator takes care of the opening and closing of the Window.
Before opening it, it adds an event listener for the Event.CLOSE, dispatched by the window after it has been closed.


    private function onOpenModularWindow_A(event:SparkWindowEvent):void
    {
    	var someWindow:ModularWindow_A = new ModularWindow_A();
    	someWindow.addEventListener(Event.CLOSE, onModularWindow_A_Closed);

    	viewManager.addContainer(someWindow);
    
    	someWindow.open();
    }


ModularWindowOpenerMediator is removing the window from the viewManager and the window dispatches a REMOVED_FROM_STAGE event.


    protected function onModularWindow_A_Closed(event:Event):void
    {
    	viewManager.removeContainer(event.currentTarget as DisplayObjectContainer);
    			
    	if (event.currentTarget.stage)
    		event.currentTarget.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
    } 

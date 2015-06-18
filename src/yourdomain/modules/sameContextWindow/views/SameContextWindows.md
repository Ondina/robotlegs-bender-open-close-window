###SameContextWindow_A 
dispatches the event REMOVED_FROM_STAGE in the handler of the Event.CLOSE

    protected function window_closeHandler(event:Event):void
    {
    	cleanUp();
    	if (stage)
    		dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
    }

###SameContextWindowMediator_A
removes the Window from  Robotlegs' viewManager 

    override public function destroy():void
    {
    	viewManager.removeContainer(view);
    	super.destroy();
    }

###SameContextWindow_B
removes itself from its owner, the WindowedSystemManager

    protected function window_closeHandler(event:Event):void
    {
    	if (stage)
    		owner.removeChild(this);
    	cleanUp();
    }

###SameContextWindowMediator_B
removes the Window from Robotlegs' viewManager

    override public function destroy():void
    {
    	viewManager.removeContainer(view);
    	super.destroy();
    }

#Robotlegs 2 and Spark Windows

**Issue**: Mediated Spark Window is not eligible for GC after closing it by clicking TitleBar's closeButton

If you're using Robotlegs, you know that if a View (Display Object) is mapped for mediation with autoRemoveEnabled set to true (default), Robotlegs removes the Mediator the moment the View dispatches an Event.REMOVED_FROM_STAGE. 

A Spark Window seems to be a special case:

1. A Window closed programmatically ( window.close(); ) dispatches a REMOVED_FROM_STAGE event, as expected. The MediatorManger receives a notification of that event and consequently the MediatorFactory removes the Mediator for the Window. 

2. After clicking on the closeButton of the TitleBar the Window disappears, but it doesn't dispatch a REMOVED_FROM_STAGE event. 
Thus, the Mediator won't be removed. 

There are a few possible workarounds for this issue.  
You can see some of them in this demo. There are already a few readmes for each use case.


The trigger was [a discussion](http://knowledge.robotlegs.org/discussions/robotlegs-2/12956-spark-window-opening-and-closing) on the forum.

The first workaround was to let the Window's system manager (WindowedSystemManger) remove the window ([like in this discussion](http://knowledge.robotlegs.org/discussions/robotlegs-2/3073-multiple-windows#comment_27350682)):

    owner.removeChild(this);

Another solution: The Window dispatches the   REMOVED_FROM_STAGE event within the [handler](https://github.com/Ondina/robotlegs-bender-open-close-window/blob/master/src/yourdomain/modules/sameContextWindow/views/components/SameContextWindow.mxml#L30) of Event.CLOSE:

	protected function window_closeHandler(event:Event):void
	{
		if (stage)
			this.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
		cleanUp();
	}

TO DO: think about how Robotlegs could solve this issue.
What if MediatorManager would add an event listener for the Event.CLOSE in its addMediator method like this:

    if (displayObject && mapping.autoRemoveEnabled)
    {
    	if(displayObject.parent is ISystemManager)
    		displayObject.addEventListener(Event.CLOSE, onRemovedFromStage)
    	else
    		displayObject.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }	

Can you see any downsides to this?







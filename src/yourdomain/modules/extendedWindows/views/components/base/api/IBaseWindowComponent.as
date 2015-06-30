package yourdomain.modules.extendedWindows.views.components.base.api
{

	public interface IBaseWindowComponent
	{
		function cleanUp():void;

		function close():void;

		function get windowTitle():String
		function set windowTitle(value:String):void
	}
}

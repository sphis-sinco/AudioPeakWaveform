package;

import flixel.FlxGame;
import openfl.display.Sprite;
import lime.app.Application;
import flixel.FlxG;

class Main extends Sprite
{
	public var gameVersion:Float = Std.parseFloat(Application.current.meta.get('version'));
	public var buildVersion:Int = 0;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState));

		FlxG.save.bind('audiopeakwaveform${#if debug 'D' #else 'R' #end}', 'Macohi');

		if
			#if CLEARBUILD
			(true)
			#else
			(FlxG.save.data.version != gameVersion)
			#end
		{
			FlxG.save.data.version = gameVersion;
			FlxG.save.data.buildVersion = 0;
		}
		else
		{
			FlxG.save.data.buildVersion++;
		}

		buildVersion = FlxG.save.data.buildVersion;

		trace('$gameVersion.$buildVersion');
	}
}

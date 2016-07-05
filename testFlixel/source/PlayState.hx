package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var _adamB:Player;
	
	override public function create():Void
	{
		_adamB = new Player(200, 200);	
		add(_adamB);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

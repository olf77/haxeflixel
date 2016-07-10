package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	private var _adamB:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	
	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.room1__oel);
		_adamB = new Player();
		
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		_map.loadEntities(placeEntities, "entities");
		
		add(_mWalls);
		add(_adamB);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_adamB, _mWalls);
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		if (entityName == "player")
		{
			_adamB.x = x;
			_adamB.y = y;
		}
	}
}

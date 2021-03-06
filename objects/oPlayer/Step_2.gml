/// @description 
if (global.paused) exit;

#region NPC Interaction
// Coordinates to check
var _len = CELLSIZE;
var _dir = moveDirection * 90;

var _checkX = x + lengthdir_x(_len, _dir);
var _checkY = y + lengthdir_y(_len, _dir);

// Get NPC
var _npcInst = instance_position(_checkX, _checkY, oNPCParent);

if (instance_exists(_npcInst)) {
	// Check for input
	if (inputSpace && is_array(_npcInst.messageData)) {
		global.textboxManager.CreateDialogue(_npcInst.messageData, method(undefined, game_pause), method(undefined, game_unpause));
		
		_npcInst.moveDirection = get_4_directional(point_direction(_npcInst.x, _npcInst.y, x, y));
	}
	
	// Show speech bubble
	if (!global.textboxManager.textboxEnabled) {
		_npcInst.iconSprite = sSpeechBubbleIcon;
	}
}
#endregion

#region Enemy Interaction
var _nearestEnemy = instance_nearest(x, y, oEnemyParent);

if (instance_exists(_nearestEnemy) && _nearestEnemy.hp > 0) {
	var _xDistance = abs(_nearestEnemy.x - x);
	var _yDistance = abs(_nearestEnemy.y - y);
	
	if (_xDistance <= CELLSIZE && _yDistance <= CELLSIZE) {
		var _battleManager = instance_create_depth(0, 0, 0, oBattleManager);
		_battleManager.InitBattle(self, [
			_nearestEnemy
		]);
	}
}
#endregion
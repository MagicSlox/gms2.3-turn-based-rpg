function BattlePlayer (_instance) constructor {
	instance = _instance;
	boxInstance = noone;
	
	isAI = false;
	
	/// @func	SelectAction
	/// @desc	Get selected action
	SelectAction = function () {
		with (oBattleActionBox) {
			if (isSelected && is_struct(action)) return action;
		}
		
		return -1;
	}
	
	/// @func	SelectOpponent
	SelectOpponent = function () {
		with (oBattleEnemyBox) {
			if (isSelected && is_struct(battlePlayer)) return battlePlayer;
		}
		
		return -1;
	}
}

function BattlePlayerAI (_name, _instances, _boxInstance) : BattlePlayer (_name, _instances, _boxInstance) constructor {
	isAI = true;
	
	SelectAction = function () {
		if (random(100) < 2.3) {
			var _len = array_length(instance.actions);
			var _index = irandom(_len - 1);
			
			return instance.actions[_index];
		}
		
		return -1;
	}
	
	SelectOpponent = function (_list) {
		if (random(100) < 2.3) {
			return _list[| 0];
		}
		
		return -1;
	}
}
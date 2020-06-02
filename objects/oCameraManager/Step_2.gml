/// @description 
// Follow player
if (cameraFollow) {
	// Player to follow
	var _plr = oPlayer;
	
	// Get camera properties
	var _camW = global.Resolution.width;
	var _camH = global.Resolution.height;
	
	// Get new position for camera
	var _camX = _plr.x - _camW / 2;
	var _camY = _plr.y - _camH / 2;
	
	// Set position
	camera_set_view_pos(camera, _camX, _camY);
}
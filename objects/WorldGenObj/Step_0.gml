/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left)) {
	
	//var mx = (mouse_x div (4 * 8)) * 4 * 8;
	//var my = (mouse_y div (4 * 8)) * 4 * 8;
	//show_debug_message(string(mx) + " " + string(my));
	//instance_create_layer(mx, my, "Instances", Chunk);
	
	chunkX = 0;
	chunkY = 0;
	
}

if (chunkX < (room_width) / (4 * 8) - 1) {
	
	if (chunkY < (room_height) / (4 * 8) - 1) {
		
		var xx = chunkX * 4 * 8;
		var yy = chunkY * 4 * 8;
		instance_create_layer(xx, yy, "Instances", Chunk);
		
		chunkY++;
		
	}
	else {
		
		chunkY = 0;
		chunkX++;
		
	}
	
}

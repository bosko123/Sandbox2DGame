// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ds_grid_set_to_grid(id, x, y, value) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	if (x < 0) {
		
		__ds_grid_resize_horizontal__(id, width - x, x);
		x = 0;
		
	}
	else if (x >= width) {
		
		__ds_grid_resize_horizontal__(id, x + 1, x);
		
	}
	
	if (y < 0) {
		
		__ds_grid_resize_vertical__(id, height - y, y);
		
	}
	else if (y >= height) {
		
		__ds_grid_resize_vertical__(id, y + 1, y);
		
	}
	
	ds_grid_set(id, x, y, value);
	ds_grid_print(id);
	
}

function ds_grid_add_to_grid(id, value, first, vertical) {
	
	if (first) {
		
		__ds_grid_resize__(id, vertical);
		__ds_grid_move__(id, vertical);
		ds_grid_set(id, 0, 0, value);
		
	}
	else {
		
		var added = __ds_grid_add_to_next__(id, value, vertical);
		if (!added) {
			
			var width = ds_grid_width(id);
			var height = ds_grid_height(id);
			__ds_grid_resize__(id, vertical);
			
			if (vertical) {
				
				ds_grid_set(id, 0, height, value);
				
			}
			else {
				
				ds_grid_set(id, width, 0, value);
				
			}
			
		}
		
	}
	
	ds_grid_print(id);
	
}

function ds_grid_print(id) {
	
	for (var j = 0; j < ds_grid_height(id); j++) {
		
		var str = "";
		
		for (var i = 0; i < ds_grid_width(id); i++) {
			
			str += string(ds_grid_get(id, i, j)) + " ";
			
		}
		
		show_debug_message(str);
		
	}
	
}
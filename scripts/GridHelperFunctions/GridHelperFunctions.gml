// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function __ds_grid_add_to_next_horizontal__(id, value) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	for (var yy = 0; yy < height; yy++) {
		
		for (var xx = 0; xx < width; xx++) {
			
			var current = ds_grid_get(id, xx, yy);
			if (current == undefined) {
				
				ds_grid_set(id, xx, yy, value);
				return true;
				
			}
			
		}
		
	}
	
	return false;
	
}

function __ds_grid_add_to_next_vertical__(id, value) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	for (var xx = 0; xx < width; xx++) {
		
		for (var yy = 0; yy < height; yy++) {
			
			var current = ds_grid_get(id, xx, yy);
			if (current == undefined) {
				
				ds_grid_set(id, xx, yy, value);
				return true;
				
			}
			
		}
		
	}
	
	return false;
	
}

function __ds_grid_add_to_next__(id, value, vertical) {
	
	if (vertical) {
		
		return __ds_grid_add_to_next_vertical__(id, value);
		
	}
	else {
		
		return __ds_grid_add_to_next_horizontal__(id, value);
		
	}
	
}

function __ds_grid_move_horizontal__(id) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	for (var yy = 0; yy < height; yy++) {
		
		for (var xx = width - 1; xx > 0; xx--) {
			
			var value = ds_grid_get(id, xx - 1, yy);
			ds_grid_set(id, xx, yy, value);
			
		}
		
		ds_grid_set(id, 0, yy, undefined);
		
	}
	
}

function __ds_grid_move_vertical__(id) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	for (var xx = 0; xx < width; xx++) {
		
		for (var yy = height - 1; yy > 0; yy--) {
			
			var value = ds_grid_get(id, xx, yy - 1);
			ds_grid_set(id, xx, yy, value);
			
		}
		
		ds_grid_set(id, xx, 0, undefined);
		
	}
	
}

function __ds_grid_move__(id, vertical) {
	
	if (vertical) {
		
		__ds_grid_move_vertical__(id);
		
	}
	else {
		
		__ds_grid_move_horizontal__(id);
		
	}
	
}

function __ds_grid_resize__(id, vertical) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	if (vertical) {
		
		ds_grid_resize(id, width, height + 1);
		
		for (var xx = 0; xx < width; xx++) {
			
			ds_grid_set(id, xx, height, undefined);
			
		}
		
	}
	else {
		
		ds_grid_resize(id, width + 1, height);
		
		for (var yy = 0; yy < height; yy++) {
			
			ds_grid_set(id, width, yy, undefined);
			
		}
		
	}
	
}

function __ds_grid_resize_horizontal__(id, w, index) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	ds_grid_resize(id, w, height);
	
	for (var yy = 0; yy < height; yy++) {
		
		for (var xx = width; xx < w; xx++) {
			
			ds_grid_set(id, xx, yy, undefined);
			
		}
		
		for (var i = 0; i < abs(index); i++) {
			
			for (var xx = (width - 1) - index; xx > 0; xx--) {
				
				var current = ds_grid_get(id, xx, yy);
				var previous = ds_grid_get(id, xx - 1, yy);
				ds_grid_set(id, xx, yy, previous);
				ds_grid_set(id, xx - 1, yy, current);
				
				//show_debug_message(previous);
				
			}
			
		}
		
	}
	
}

function __ds_grid_resize_vertical__(id, h, index) {
	
	var width = ds_grid_width(id);
	var height = ds_grid_height(id);
	
	ds_grid_resize(id, width, h);
	
	for (var xx = 0; xx < width; xx++) {
		
		for (var yy = height; yy < h; yy++) {
			
			ds_grid_set(id, xx, yy, undefined);
			
		}
		
		for (var i = 0; i < abs(index); i++) {
			
			for (var yy = (height - 1) - index; yy > 0; yy--) {
				
				var current = ds_grid_get(id, xx, yy);
				var previous = ds_grid_get(id, xx, yy - 1);
				ds_grid_set(id, xx, yy, previous);
				ds_grid_set(id, xx, yy - 1, current);
				
				//show_debug_message(previous);
				
			}
			
		}
		
	}
	
}
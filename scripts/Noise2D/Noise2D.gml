// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Random2D(x_coord, y_coord) {
	
	random_set_seed(x_coord + y_coord * 7190 + global.seed);
	return random_range(-1, 1);
	
}

function SmoothedNoise2D(x_coord, y_coord) {
	
	var corners = (
		Random2D(x_coord - 1, y_coord - 1) + 
		Random2D(x_coord + 1, y_coord - 1) + 
		Random2D(x_coord - 1, y_coord + 1) + 
		Random2D(x_coord + 1, y_coord + 1)
	) / 16;
	var sides = (
		Random2D(x_coord - 1, y_coord) + 
		Random2D(x_coord + 1, y_coord) + 
		Random2D(x_coord, y_coord - 1) + 
		Random2D(x_coord, y_coord + 1)
	) / 8;
	var center = Random2D(x_coord, y_coord) / 4;
	
	return corners + sides + center;
	
}

function InterpolationNoise2D(x_coord, y_coord) {
	
	var min_x = int64(x_coord);
	var max_x = min_x + 1;
	var fract_x = x_coord - min_x;
	
	var min_y = int64(y_coord);
	var max_y = min_y + 1;
	var fract_y = y_coord - min_y;
	
	var val_1 = SmoothedNoise2D(min_x, min_y);
	var val_2 = SmoothedNoise2D(max_x, min_y);
	var val_3 = SmoothedNoise2D(min_x, max_y);
	var val_4 = SmoothedNoise2D(max_x, max_y);
	
	var int_1 = lerp(val_1, val_2, fract_x);
	var int_2 = lerp(val_3, val_4, fract_x);
	
	return lerp(int_1, int_2, fract_y);
	
}

function Noise2D(x_coord, y_coord) {
	
	var total = 0;
	var octives = 16;
	
	var frequency_persistance = 2;
	var amplitude_persistance = 3;
	
	var frequency = 0.25;
	var amplitude = 4;
	
	for (var i = 0; i < octives; i++) {
		
		total += InterpolationNoise2D(x_coord * frequency, y_coord * frequency) * amplitude;
		
		frequency *= frequency_persistance;
		amplitude /= amplitude_persistance;
		
	}
	
	return total;
	
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SmoothNoise(t) {
	
	return 6 * power(t, 5) - 15 * power(t, 4) + 10 * power(t, 3);
	
}

function InterpolationNoise(x_coord) {
	
	var x_min = floor(x_coord);
	var x_max = x_min + 1;
	var x_fractional = x_coord - x_min;
	
	random_set_seed(x_min + global.seed);
	var left = random_range(-1, 1);
	random_set_seed(x_max + global.seed);
	var right = random_range(-1, 1);
	
	return lerp(left, right, SmoothNoise(x_fractional));
	
}

function Noise(x_coord) {
	
	var total = 0;
	var octives = 8;
	
	var frequency_persistance = 2;
	var amplitude_persistance = 2;
	
	var frequency = 1;
	var amplitude = 1;
	
	for (var i = 0; i < octives; i++) {
		
		total += testNoise(x_coord * frequency) * amplitude;
		
		frequency *= frequency_persistance;
		amplitude /= amplitude_persistance;
		
	}
	
	return total;
	
}

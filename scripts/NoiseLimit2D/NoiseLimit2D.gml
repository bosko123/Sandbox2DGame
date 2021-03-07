// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function smoothedNoise2D2(v) {
	
	var corners = (4 * v) / 4;
	var sides = (4 * v) / 2;
	var center = v / 1;
	
	return corners * sides * center;
	
}

function InterpolationNoise2D2(v) {
	
	var val_1 = smoothedNoise2D2(v);
	var val_2 = smoothedNoise2D2(v);
	var val_3 = smoothedNoise2D2(v);
	var val_4 = smoothedNoise2D2(v);
	
	var int_1 = lerp(val_1, val_2, 0);
	var int_2 = lerp(val_3, val_4, 0);
	
	return lerp(int_1, int_2, 0);
	
}

function noise2D2(v) {
	
	var total = 0;
	var octives = 4;
	
	var amplitude_persistance = 3;
	
	var amplitude = 4;
	
	for (var i = 0; i < octives; i++) {
		
		total += InterpolationNoise2D2(v) * amplitude;
		
		amplitude /= amplitude_persistance;
		
	}
	
	return total;
	
}

function maxNoiseValue2D() {
	
	return noise2D2(1);
	
}

function minNoiseValue2D() {
	
	return noise2D2(-1);
	
}
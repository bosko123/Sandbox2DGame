// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function testSmooth2(v) {
	
	var v1 = v / 2;
	var v2 = v / 4;
	var v3 = v / 4;
	
	return v1 + v2 + v3;
	
}

function testNoise2(v) {
	
	var val_1 = testSmooth2(v);
	var val_2 = testSmooth2(v);
	
	return lerp(val_1, val_2, 0);
	
}

function noise2(v) {
	
	var total = 0;
	var octives = 8;
	
	var amplitude_persistance = 2;
	
	var amplitude = 1;
	
	for (var i = 0; i < octives; i++) {
		
		total += testNoise2(v) * amplitude;
		
		amplitude /= amplitude_persistance;
		
	}
	
	return total;
	
}

function maxNoiseValue() {
	
	return noise2(1);
	
}

function minNoiseValue() {
	
	return noise2(-1);
	
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function testRandom(x_coord) {
	
	random_set_seed(x_coord + global.seed);
	return random_range(-1, 1);;
	
}

function testSmooth(x_coord) {
	
	var v1 = testRandom(x_coord) / 2;
	var v2 = testRandom(x_coord - 1) / 4;
	var v3 = testRandom(x_coord + 1) / 4;
	
	return v1 + v2 + v3;
	
}

function testNoise(x_coord) {
	
	var int_x = int64(x_coord);
	var x_fractional = x_coord - int_x;
	
	var val_1 = testSmooth(int_x);
	var val_2 = testSmooth(int_x + 1);
	
	return lerp(val_1, val_2, x_fractional);
	
}
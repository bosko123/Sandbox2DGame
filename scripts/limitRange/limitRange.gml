// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function limitRange(oldValue, oldMin, oldMax, newMin, newMax) {
	
	var oldRange = oldMax - oldMin;
	var newRange = newMax - newMin;
	
	var newValue = (((oldValue - oldMin) * newRange) / oldRange) + newMin;
	
	return newValue;
	
}
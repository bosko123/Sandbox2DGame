// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generateTerrain() {
	//var str = "";
	//var str2 = "";
	
	for (var i = 0; i < ds_grid_width(chunkBlocks); i++) {
	
		var xx = i * baseBlockSize + chunkTotalSize * chunkIndexX;
		
		var yy = (floor(Noise(xx / 120) * 31) + 70);
		
		//str += string(128 - yy) + " ";
		//str2 += string(128 - yy) + " ";
		
		var maxHeight = ds_grid_height(chunkBlocks);
		var start = clamp(128 - yy - maxHeight * chunkIndexY, 0, maxHeight);
		
		for (var j = start; j < maxHeight; j++) {
		
			ds_grid_set(chunkBlocks, i, j, 1);
		
		}
	
	}
	
	/*ds_grid_print(chunkBlocks);
	show_debug_message(str);
	show_debug_message(str2);
	show_debug_message(string(chunkIndexY));
	show_debug_message(string(size * chunkIndexY) + " " + string(size * chunkIndexY + 15));*/
	
}

function generateCaves() {
	
	for (var i = 0; i < ds_grid_width(chunkBlocks); i++) {
		
		var xx = i * baseBlockSize + chunkTotalSize * chunkIndexX;
		
		var maxHeight = ds_grid_height(chunkBlocks);
		var start = clamp(72 - maxHeight * chunkIndexY, 0, maxHeight);
		var end0 = clamp(240 - maxHeight * chunkIndexY, 0, maxHeight);
		
		for (var j = start; j < end0; j++) {
			
			var yy = j * baseBlockSize + chunkTotalSize * chunkIndexY;
			
			var value = Noise2D(xx / 13, yy / 13);
			value = limitRange(value, minNoiseValue2D(), maxNoiseValue2D(), 0, 1);
		
			if (value > 0.5075 && value < 0.6) {
			
				ds_grid_set(chunkBlocks, i, j, 0);
			
			}
			
			
			
		}
		
	}
	
}
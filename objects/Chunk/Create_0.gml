/// @description Insert description here
// You can write your code in this editor

size = 4;
baseBlockSize = sprite_get_width(spr_dirt);

chunkTotalSize = size * baseBlockSize;

chunkIndexX = x div chunkTotalSize;
chunkIndexY = y div chunkTotalSize;
biomeIndex = 0;

chunkBlocks = ds_grid_create(size, size);

generateTerrain();
generateCaves();

//ds_grid_print(chunkBlocks);

//show_debug_message(string(ds_grid_width(chunkBlocks)) + " " + string(ds_grid_height(chunkBlocks)));
//show_debug_message(string(sqrt(2)) + " " + string(power(2, 1 / 2)));

surface = surface_create(
		ds_grid_width(chunkBlocks) * baseBlockSize, 
		ds_grid_height(chunkBlocks) * baseBlockSize
	);
surface_set_target(surface);

for (var i = 0; i < ds_grid_width(chunkBlocks); i++) {
	
	for (var j = 0; j < ds_grid_height(chunkBlocks); j++) {
		
		var v = ds_grid_get(chunkBlocks, i, j);
		if (v == 0)
			continue;
		var xx = i * baseBlockSize;
		var yy = j * baseBlockSize;
		draw_sprite(spr_dirt, 0, xx, yy);
		
	}
	
}

surface_reset_target();

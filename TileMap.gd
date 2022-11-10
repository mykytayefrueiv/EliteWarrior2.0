extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_used_cells();
	print(get_used_cells())
	print(map_to_world(cells[0]))
	pass # Replace with function body.


func get_cell_center_global_position(pos):
	var cell = world_to_map(pos);
	var cellCoords = map_to_world(cell);
	cellCoords.x -= 16;
	cellCoords.y += 16;
	
	return cellCoords;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

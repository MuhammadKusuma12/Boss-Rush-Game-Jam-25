extends Node2D

# Chart of atlas coordinates of each tiles

var tileChart = {
	["Dirt","Dirt", "Dirt", "Grass"] : Vector2i(0,0),
	["Grass","Grass", "Dirt", "Dirt"] : Vector2i(1,0),
	["Grass","Dirt", "Grass", "Grass"] : Vector2i(2,0),
	["Grass","Dirt", "Dirt", "Grass"] : Vector2i(3,0),
	["Grass","Dirt", "Grass", "Dirt"] : Vector2i(0,1),
	["Grass","Grass", "Dirt", "Grass"] : Vector2i(1,1),
	["Grass","Grass", "Grass", "Grass"] : Vector2i(2,1),
	["Dirt","Grass", "Grass", "Grass"] : Vector2i(3,1),
	["Dirt","Grass", "Dirt", "Dirt"] : Vector2i(0,2),
	["Dirt", "Grass", "Grass", "Dirt"] : Vector2i(1,2),
	["Grass", "Grass", "Grass", "Dirt"] : Vector2i(2,2),
	["Dirt", "Dirt", "Grass", "Grass"] : Vector2i(3,2),
	["Dirt", "Dirt", "Dirt", "Dirt"] : Vector2i(0,3),
	["Grass", "Dirt", "Dirt", "Dirt"] : Vector2i(1,3),
	["Dirt", "Grass", "Dirt", "Grass"] : Vector2i(2,3),
	["Dirt", "Dirt", "Grass", "Dirt"] : Vector2i(3,3),
}

func _ready() -> void:
	# Match the tiles
	for i in $Display.get_used_cells():
		$Display.set_cell(i, 0,tileChart[[getTileType(i), getTileType(i+Vector2i(0,-1)), getTileType(i + Vector2i(-1,-1)), getTileType(i + Vector2i(-1,0))]])
		#print(getTileType(i), getTileType(i+Vector2i(0,-1)), getTileType(i + Vector2i(-1,-1)), getTileType(i + Vector2i(-1,0)))

func getTileType(coord : Vector2i):
	var tileAtlas : Vector2i = $GroundData.get_cell_atlas_coords(coord)
	if tileAtlas == Vector2i(2,1):
		return "Grass"
	else:
		return "Dirt"

extends TileMap

var ground_tile = preload("res://images/ground1.png")
var wall_tile = preload("res://images/wall1.png")
var obstacle_tile = preload("res://images/obs1.png")

var collision_shape: CollisionShape2D


func _ready():
	generate_level()

func generate_level():
	# Define the size of the level (adjust as needed)
	var level_width = 100
	var level_height = 50

	# Clear existing tiles
	clear()

	# Generate ground
	for x in range(level_width):
		for y in range(level_height):
			set_cell(0, Vector2i(x, y), 0, Vector2i(3, 7))

	# Generate walls (top and sides)ff
	for x in range(level_width):
		set_cell(0, Vector2i(x, 0), 0, Vector2i(1, 1))
		set_cell(0, Vector2i(x, level_height - 1), 0, Vector2i(1, 1))

	for y in range(level_height):
		set_cell(0, Vector2i(0, y), 0, Vector2i(11, 12))
		set_cell(0, Vector2i(level_width - 1, y), 0, Vector2i(11, 12))

	# Generate random obstacles
	for x in range(level_width * level_height*2):  # Adjust density as needed
		var obstacle_x = randi() % (level_width - 2) + 1
		var obstacle_y = randi() % (level_height - 2) + 1
		set_cell(0, Vector2i(obstacle_x, obstacle_y), 1, Vector2i(12, 6))

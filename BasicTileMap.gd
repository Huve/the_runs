extends TileMap

var collision_shape: CollisionShape2D

func _ready():
	var level_width = 40
	var level_height = 20
	generate_level(level_width, level_height)
	#randomize_goal_location(level_width, level_height)
	

func generate_level(level_width, level_height):

	# Clear existing tiles
	clear()

	# Generate ground
	for x in range(level_width):
		for y in range(level_height):
			set_cell(0, Vector2i(x, y), 0, Vector2i(2, 7))

	# Generate walls (top and sides)
	for x in range(level_width):
		set_cell(0, Vector2i(x, 0), 0, Vector2i(6, 8))
		set_cell(0, Vector2i(x, level_height - 1), 0, Vector2i(6, 8))

	for y in range(level_height):
		set_cell(0, Vector2i(0, y), 0, Vector2i(6, 8))
		set_cell(0, Vector2i(level_width - 1, y), 0, Vector2i(6, 8))

	# Generate random obstacles
	for x in range(level_width * level_height):  # Adjust density as needed
		var chance = randf()
		if chance > .90:
			var obstacle_x = randi() % (level_width) - 1
			var obstacle_y = randi() % (level_height) - 1
			if obstacle_x < 2 or obstacle_y < 2:
				pass
			elif chance > .96:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 0, Vector2i(1, 5))
			else:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 0, Vector2i(1, 3))


extends TileMap

@onready var GameInfo = get_node("/root/GameInfoNode")

var collision_shape: CollisionShape2D

func _ready():
	var level_width = 40
	var level_height = 20
	randomize_goal_location(level_width, level_height)
	generate_level(level_width, level_height)

	
func is_loc_of_object(node, x, y):
	var node_loc = local_to_map(node.get_global_position())
	var distance = Vector2(node_loc.x, node_loc.y).distance_to(Vector2(x, y))
	if x == node_loc.x and y == node_loc.y:
		return true
	elif distance < 5:
		return true
	else:
		return false
		
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
	var player_node = get_node("/root/Game/PlayerCharacterBody2D")
	var goal_node = get_node("/root/Game/ToiletArea2D") 
	var level_difficulty = min(GameInfo.level_count*.05, .5)
	print(level_difficulty)
	
	for x in range(level_width * level_height):  # Adjust density as needed
		var obstacle_chance = randf() 
		
		if obstacle_chance < level_difficulty:
			var obstacle_x = randi() % (level_width) - 1
			var obstacle_y = randi() % (level_height) - 1
			if obstacle_x < 2 or obstacle_y < 1:
				pass
			elif is_loc_of_object(player_node, obstacle_x, obstacle_y):
				pass
			elif is_loc_of_object(goal_node, obstacle_x, obstacle_y):
				pass
			elif obstacle_chance < level_difficulty / 3:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 0, Vector2i(1, 5))
			else:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 0, Vector2i(1, 3))

func randomize_goal_location(w, h):
	# Randomize where the goal will be
	var randomizer = RandomNumberGenerator.new()
	var max_x = w*16 - 32
	var min_x = w*16 - 100
	var min_y = 32
	var max_y = h*16 - 32
	var random_x = randomizer.randi_range(min_x, max_x) 
	var random_y = randomizer.randi_range(min_y, max_y)
	
	get_node("/root/Game/ToiletArea2D").position.x = random_x
	get_node("/root/Game/ToiletArea2D").position.y = random_y

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
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var sprite_row = 1
	if GameInfo.level_count <= 5:
		sprite_row = GameInfo.level_count * 2 - 1
	else:
		sprite_row = rng.randi_range(1,5) * 2 - 1
	
	var left_wall = Vector2i(8, sprite_row)
	var bottom_wall = Vector2i(9, sprite_row)
	var right_wall = Vector2i(10, sprite_row)
	var top_wall = Vector2i(11, sprite_row)
	var obstacle_1 = Vector2i(12,sprite_row)
	var obstacle_2 = Vector2i(13,sprite_row)
	var obstacle_3 = Vector2i(14,sprite_row)
	var obstacle_4 = Vector2i(15,sprite_row)
	

	# Generate ground
	for x in range(level_width):
		for y in range(level_height):
			var floor_tile = Vector2i(rng.randi_range(1,3), sprite_row)
			set_cell(0, Vector2i(x, y), 1, floor_tile)

	# Generate walls (top and sides)
	for x in range(level_width):
		set_cell(1, Vector2i(x, 0), 1, bottom_wall)
		set_cell(1, Vector2i(x, level_height - 1), 1, top_wall)

	for y in range(level_height):
		set_cell(1, Vector2i(0, y), 1, left_wall)
		set_cell(1, Vector2i(level_width - 1, y), 1, right_wall)
		
	# Set corners
	set_cell(1, Vector2i(0,0), 1, Vector2i(4, sprite_row))
	set_cell(1, Vector2i(0, level_height-1), 1, Vector2i(7, sprite_row))
	set_cell(1, Vector2i(level_width-1, 0), 1, Vector2i(5, sprite_row))
	set_cell(1, Vector2i(level_width-1, level_height-1), 1, Vector2i(6, sprite_row))

	# Generate random obstacles
	var player_node = get_node("/root/Game/PlayerCharacterBody2D")
	var goal_node = get_node("/root/Game/ToiletArea2D") 
	var level_difficulty = min(GameInfo.level_count*.05, .5)
	
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
			elif obstacle_chance < level_difficulty / 4:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 1, obstacle_1)
			elif obstacle_chance < level_difficulty / 3:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 1, obstacle_2)
			elif obstacle_chance < level_difficulty / 2:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 1, obstacle_3)
			else:
				set_cell(1, Vector2i(obstacle_x, obstacle_y), 1, obstacle_4)

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

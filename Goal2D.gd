extends Area2D

func randomize_goal_location(w, h):
	# Randomize where the goal will be
	var randomizer = RandomNumberGenerator.new()
	var max_x = w*16 - 20
	var min_x = w*16 - 100
	var min_y = 20
	var max_y = h*16 - 20
	var random_x = randomizer.randi_range(min_x, max_x) 
	var random_y = randomizer.randi_range(min_y, max_y)
	
	get_node("/root/Game/ToiletArea2D").position.x = random_x
	get_node("/root/Game/ToiletArea2D").position.y = random_y
	
func _ready():

	randomize_goal_location(40, 20)


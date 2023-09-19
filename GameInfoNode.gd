extends Node

@onready var highest_score = load_high_score()

var default_total_score = 10
var total_score = 10
var current_level_score = 0
var high_score_path = "user://high_scores.dat"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func reset():
	total_score = default_total_score
	current_level_score = 0
	
func save_high_score():
	highest_score = load_high_score()
	var file = FileAccess.open(high_score_path, FileAccess.WRITE)
	if total_score > highest_score:
		print(str(total_score), "  > ", str(highest_score))
		print("saving ", str(total_score))
		file.store_64(total_score)
	else:
		print(str(total_score), "  !> ", str(highest_score))
		print("saving ", str(highest_score))
		file.store_64(highest_score)

func load_high_score():
	if FileAccess.file_exists(high_score_path):
		var file = FileAccess.open(high_score_path, FileAccess.READ)
		var new_high_score = file.get_64()
		return new_high_score
	else:
		print('no file found, setting to 0')
		var new_high_score = 0
		return new_high_score

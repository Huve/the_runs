extends Node

var default_total_score = 10
var total_score = 10
var current_level_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func reset():
	total_score = default_total_score
	current_level_score = 0

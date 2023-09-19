extends Control

var label: Label
var game_time: int
var STARTING_POINTS = 60

func countdown_timer(game_time: float) -> float:
	# Update the game time.
	# Return the updated game time
	STARTING_POINTS -= game_time
	if STARTING_POINTS < 1:
		STARTING_POINTS = 0
	return STARTING_POINTS

# Called when the node enters the scene tree for the first time.
func _ready():
	# Create a Label node and add it to the scene tree.
	label = Label.new()
	add_child(label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		
	# Update the game time.
	game_time = countdown_timer(_delta)
	# Update the text of the Label node
	label.set_text(str(game_time))

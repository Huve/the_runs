extends Node2D

var game_score: int = 0

func _ready():
	# Set the text of the Label node to the current game score.
	var game_score_text = "Total score: " + str(game_score)
	get_node("CurrentScoreLabel").set_text(str(game_score_text))

func _process(delta: float):
	# Update the game score.
	game_score += 1

	# Update the text of the Label node.
	var game_score_text = "Total score: " + str(game_score)
	get_node("CurrentScoreLabel").set_text(str(game_score_text))

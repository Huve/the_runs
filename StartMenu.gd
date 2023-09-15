extends Node

# Load the high scores and game scenes
var high_scores_scene = preload("res://HighScores.tscn")
var game_scene = preload("res://Game.tscn")

func _ready():
	# Connect button signals
	pass
	#$ButtonHighScores.pressed.connect(_on_high_scores_pressed)

func _on_new_game_pressed():
	# Switch to the Game scene
	get_tree().change_scene_to_file(game_scene)

func _on_high_scores_pressed():
	# Switch to the High Scores scene
	get_tree().change_scene_to_file("res://HighScores.tscn")


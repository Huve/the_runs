extends Node


func _ready():
	# Connect button signals
	pass


func _on_high_scores_pressed():
	# Switch to the High Scores scene
	get_tree().change_scene_to_file("res://HighScores.tscn")

func _on_button_new_game_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")

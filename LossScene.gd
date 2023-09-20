extends Node2D

@onready var GameInfo = get_node("/root/GameInfoNode")

# Called when the node enters the scene tree for the first time.
func _ready():
	var final_score = GameInfo.total_score
	var final_score_text = "Final score: " + str(final_score)
	GameInfo.save_high_score()
	get_node("CanvasLayer/EndScoreLabel").set_text(final_score_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_main_menu_button_pressed():
	GameInfo.reset()
	get_tree().change_scene_to_file("res://StartMenu.tscn")


func _on_retry_button_pressed():
	GameInfo.reset()
	get_tree().change_scene_to_file("res://Game.tscn")

extends Control

@onready var GameInfo = get_node("/root/GameInfoNode")

var level_score = 10

func countdown_timer(score: float, time: float) -> int:
	# Update the game time.
	score -= time
	if score < 1:
		score = 0
	return int(score)

# Called when the node enters the scene tre	e for the first time.
func _ready():
	# Create a Label node and add it to the scene tree.
		# Set the text of the Label node to the current game score.
	var level_timer = get_node("LevelTimer")
	level_timer.wait_time = 1.0
	level_timer.start()
	
	var loss_timer = get_node("LossTimer")
	loss_timer.wait_time = GameInfo.global_level_time
	loss_timer.start()
	
	var level_time_text = "Time: " + str(GameInfo.global_level_time)
	get_node("LevelTimeLabel").set_text(level_time_text)
	
	var game_score_text = "Total score: " + str(GameInfo.total_score)
	get_node("CurrentScoreLabel").set_text(game_score_text)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	# Update the game time.


func _on_level_timer_timeout():
	level_score = countdown_timer(level_score, 1)
	GameInfo.global_level_time = countdown_timer(GameInfo.global_level_time, 1)
	GameInfo.current_level_score = level_score
	# Update the text of the Label node.
	var game_score_text = "Total score: " + str(GameInfo.total_score)
	get_node("CurrentScoreLabel").set_text(str(game_score_text))
	var level_time_text = "Time: " + str(GameInfo.global_level_time)
	get_node("LevelTimeLabel").set_text(str(level_time_text))


func _on_loss_timer_timeout():
	get_tree().change_scene_to_file("res://LossScene.tscn")

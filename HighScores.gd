extends Node2D

@onready var GameInfo = get_node("/root/GameInfoNode")

# Function to load and display high scores
func load_high_score():
	# Load high scores from your game's data source (e.g., a file or an array)
	var high_score = GameInfo.load_high_score()
	var HighScoreContainer = get_node('CanvasLayer/HighScoreContainer')

	var label = Label.new()
	label.text = str(high_score)
	HighScoreContainer.add_child(label)

# Function to handle the back button press
func _on_back_button_pressed():
	# Return to the Start Menu (you can implement this logic based on your project structure)
	get_tree().change_scene_to_file("res://StartMenu.tscn")

func _ready():
	# Call the function to load and display high scores
	load_high_score()




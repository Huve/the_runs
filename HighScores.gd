extends Node2D

# Function to load and display high scores
func load_high_scores():
	# Load high scores from your game's data source (e.g., a file or an array)
	var high_scores = [192]
	var HighScoreContainer = get_node('CanvasLayer/HighScoreContainer')
	#load_high_scores_from_source()

	# Iterate through the high scores and create Label nodes for each entry
	
	for score in high_scores:
		var label = Label.new()
		label.text = "Player: " + "None "+ " - Score: " + str (score)
		HighScoreContainer.add_child(label)

# Function to handle the back button press
func _on_back_button_pressed():
	# Return to the Start Menu (you can implement this logic based on your project structure)
	get_tree().change_scene_to_file("res://StartMenu.tscn")

func _ready():
	# Call the function to load and display high scores
	#var BackButton = get_node('CanvasLayer/BackButton')
	load_high_scores()

	# Connect the "pressed" signal of the "Back" button to the _on_back_button_pressed function


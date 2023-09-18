extends CharacterBody2D


const SPEED = 200.0
var STARTING_POINTS = 60

var collision_shape: CollisionShape2D
var label: Label
var game_time: int

@onready var _animation_player = $AnimationPlayer

func countdown_timer(game_time: float) -> float:
	# Update the game time.
	# Return the updated game time
	STARTING_POINTS -= game_time
	if STARTING_POINTS < 1:
		STARTING_POINTS = 0
	return STARTING_POINTS

func _ready():
  # Create a Label node and add it to the scene tree.
	label = Label.new()
	add_child(label)

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("run")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("run")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("run")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("run")
	else:
		_animation_player.stop()
	
	# Update the game time.
	game_time = countdown_timer(_delta)
	# Update the text of the Label node
	label.set_text(str(game_time))

	
func _physics_process(delta):
	
	# Get the player's input.
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Normalize the input vector. This ensures that the character moves at the same speed in all directions.
	input = input.normalized()

	# Set the character's velocity based on the input.
	velocity = input * SPEED
	
	# Move the character.
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("I collided with ", collision.get_collider().name)



func _on_toilet_area_2d_body_entered(body):
	print("entered")

extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
@onready var GameInfo = get_node("/root/GameInfoNode")

const SPEED = 200.0

var collision_shape: CollisionShape2D

func _ready():
	pass

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

	
func _physics_process(delta):
	
	# Get the player's input.
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Normalize the input vector. This ensures that the character moves at the same speed in all directions.
	input = input.normalized()

	# Set the character's velocity based on the input.
	velocity = input * SPEED
	
	# Move the character.
	var _collision = move_and_collide(velocity * delta)
	#if _collision:
	#	print("I collided with ", _collision.get_collider().name)

func _on_toilet_area_2d_body_entered(_body):
	print(str(GameInfo.total_score) + " " + str(GameInfo.current_level_score) + " 5")
	GameInfo.total_score = GameInfo.total_score + GameInfo.current_level_score + 5
	GameInfo.level_count += 1
	GameInfo.global_level_time += 5

	get_tree().change_scene_to_file("res://Game.tscn")

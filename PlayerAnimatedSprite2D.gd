extends AnimatedSprite2D

const SPEED = 200 # pixels per second

var velocity = Vector2.ZERO

func _physics_process(delta):
	# Get the player's input.
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector += Vector2.UP
	if Input.is_action_pressed("ui_down"):
		input_vector += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		input_vector += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		input_vector += Vector2.RIGHT

	# Normalize the input vector.
	input_vector = input_vector.normalized()

	# Apply the input vector to the velocity.
	velocity = velocity.lerp(input_vector * SPEED, delta)
	if velocity.length() > 0:
		self.play("running")
	else:
		self.stop()
		

	# Move the player.
	set_position(get_position() + velocity * delta)

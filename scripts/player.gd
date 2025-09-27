extends CharacterBody2D

@export var speed = 900.0 # How fast the dove moves in pixels/sec
@export var feather_count = 3 # How many feathers the dove can drop

func _physics_process(delta):
	# Get input from arrow keys or WASD
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Set velocity based on input and speed
	velocity = direction * speed

	# move_and_slide() is a built-in function that moves the body
	# and handles collisions with other physics bodies.
	move_and_slide()

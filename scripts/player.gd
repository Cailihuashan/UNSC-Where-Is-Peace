extends CharacterBody2D

@export var speed = 900.0 
@export var feather_count = 3 

func _physics_process(delta):
	# Get input from arrow keys
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Set velocity based on input and speed
	velocity = direction * speed
	move_and_slide()
	
func die():
	get_tree().reload_current_scene()

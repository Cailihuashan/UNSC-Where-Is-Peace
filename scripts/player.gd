extends CharacterBody2D

@export var speed = 900.0 
@export var feather_count = 3 
@export var padding = 50.0

var screen_size: Vector2
var camera: Camera2D

func _ready() -> void:
	screen_size = get_viewport_rect().size
	camera = $Camera2D

func _physics_process(delta):
	# Get input from arrow keys
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Set velocity based on input and speed
	velocity = direction * speed
	move_and_slide()
	enforce_boundaries()

func enforce_boundaries():
	if not camera:
		return
	
	var left_limit = camera.limit_left + padding
	var right_limit = camera.limit_right - padding
	var top_limit = camera.limit_top + padding
	var bottom_limit = camera.limit_bottom - padding
	
	position.x = clamp(position.x, left_limit, right_limit)
	position.y = clamp(position.y, top_limit, bottom_limit)
	
func die():
	get_tree().reload_current_scene()

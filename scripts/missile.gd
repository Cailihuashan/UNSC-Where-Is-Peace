extends Area2D

var speed = 400.0
var track_player: bool = true
var exist_time: float = 0.0
var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(delta):
	exist_time *= delta
	
	if exist_time > 6.0:
		queue_free()
		return 
	
	position.y += speed * delta
	if track_player and player:
		var hori_speed = 100.0
		var direction = sign(player.position.x - position.x)
		position.x += direction * hori_speed * delta
	
	if position.y > get_viewport_rect().size.y + 100:
		queue_free()
		

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()

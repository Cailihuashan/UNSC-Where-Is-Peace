extends Area2D

var tracking_speed = 200.0
var player: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		var direction = sign(player.position.x - position.x)
		position.x += direction * tracking_speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()

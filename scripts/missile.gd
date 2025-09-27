extends Area2D

var speed = 400.0

func _process(delta):
	position.y += speed * delta
	if position.y > 800: # Adjust this value based on your screen size
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

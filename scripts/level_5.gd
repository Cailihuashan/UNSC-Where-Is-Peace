extends Node2D

const MISSILE_SCENE = preload("res://scenes/missile.tscn")
const VETO_HAND_SCENE = preload("res://scenes/veto_hand.tscn")


func _on_missile_timer_timeout():
	var screen_size = get_viewport_rect().size
	var missile = MISSILE_SCENE.instantiate()
	missile.position = Vector2(randf_range(0, screen_size.x), -50)
	add_child(missile)


func _on_veto_hand_timer_timeout() -> void:
	var screen_size = get_viewport_rect().size
	var hand = VETO_HAND_SCENE.instantiate()
	hand.position = Vector2(randf_range(0, screen_size.x), -300)
	add_child(hand)
	var play_hand = hand.get_node("AnimationPlayer")
	play_hand.play("slam")
	
	await play_hand.animation_finished
	
	hand.queue_free()

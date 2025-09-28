extends Node2D

const MISSILE_SCENE = preload("res://scenes/missile.tscn")
const VETO_HAND_SCENE = preload("res://scenes/veto_hand.tscn")


func _on_missile_timer_timeout():
	var player = $Player
	if not player:
		return
	var camera = player.get_node("Camera2D")
	var screen_size = get_viewport_rect().size
	var camera_top = camera.global_position.y - screen_size.y / 2
	var missile = MISSILE_SCENE.instantiate()
	missile.position = Vector2(
		randf_range(player.position.x + 1200, player.position.x + 200),
		player.position.y - 800  
	)	
	add_child(missile)


func _on_veto_hand_timer_timeout() -> void:
	var player = $Player
	if not player:
		return 
		
	var screen_size = get_viewport_rect().size
	var hand = VETO_HAND_SCENE.instantiate()
	hand.position = Vector2(player.position.x, player.position.y - 400)
	add_child(hand)
	var play_hand = hand.get_node("AnimationPlayer")
	play_hand.play("slam")
	
	await play_hand.animation_finished
	
	hand.queue_free()


func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

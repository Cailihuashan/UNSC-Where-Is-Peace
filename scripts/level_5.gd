extends Node2D

const MISSILE_SCENE = preload("res://scenes/missile.tscn")
const VETO_HAND_SCENE = preload("res://scenes/veto_hand.tscn")


func _on_missile_timer_timeout():
	var player = $Player
	var missile = MISSILE_SCENE.instantiate()
	
	var height_above_player = 200
	missile.position = Vector2(randf_range(player.position.x - 100, player.position.x + 100), player.position.y - height_above_player - randf_range(0, 100))
	add_child(missile)


func _on_veto_hand_timer_timeout() -> void:
	var player = $Player
	var hand = VETO_HAND_SCENE.instantiate()
	var height_above_player = 300
	hand.position = Vector2(player.position.x, player.position.y - height_above_player)
	add_child(hand)
	var play_hand = hand.get_node("AnimationPlayer")
	play_hand.play("slam")
	await play_hand.animation_finished
	hand.queue_free()


func _on_goal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

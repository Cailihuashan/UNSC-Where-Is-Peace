extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	$Explanation.visible = true

	await get_tree().create_timer(10.0).timeout
	$"For countries".visible = true

	await get_tree().create_timer(10.0).timeout
	$"Against countries".visible = true

	await get_tree().create_timer(5).timeout
	$Vetoed.visible = true

extends Node2D

@export var background_scenes: Array[PackedScene] = []
@export var background_width: float = 1152 

var current_section: int = 0
var active_backgrounds: Array = []
var player_ref: Node2D

func _ready():
	await get_tree().process_frame
	player_ref = get_tree().get_first_node_in_group("player")
	if background_scenes.is_empty():
		return
	create_background_at_index(0)
	# Pre-load some backgrounds
	for i in range(1, min(3, background_scenes.size())):
		create_background_at_index(i)
		
func create_background_at_index(index: int):
	if index >= background_scenes.size():
		return
	var new_bg = background_scenes[index].instantiate()
	add_child(new_bg)
	new_bg.position.x = index * background_width
	active_backgrounds.append(new_bg)

func _process(_delta):
	if not player_ref:
		return
	var player_section = int(player_ref.position.x / background_width)
	if player_section > current_section:
		current_section = player_section
		var next_needed = current_section + 2
		if next_needed < background_scenes.size() and next_needed >= active_backgrounds.size():
			create_background_at_index(next_needed)
		

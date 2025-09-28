extends Node2D

@export var background_scenes: Array[PackedScene] = []
@export var background_width: float = 1152 

var current_section: int = 0
var backgrounds: Array = []
var player_ref: Node2D

func _ready():
	await get_tree().process_frame
	player_ref = get_tree().get_first_node_in_group("player")
	if background_scenes.size() > 0:
		spawn_background(0)
	for i in range(1, min(3, background_scenes.size())):
		spawn_background(i)
		
func spawn_background(index: int):
	if index >= background_scenes.size():
		return
	var bg_instance = background_scenes[index].instantiate()
	add_child(bg_instance)
	bg_instance.position.x = index * background_width
	backgrounds.append(bg_instance)
	

func _process(_delta):
	if not player_ref:
		return
	var player_section = int(player_ref.position.x / background_width)
	if player_section > current_section:
		current_section = player_section
		var next_needed = current_section + 2
		if next_needed < background_scenes.size() and next_needed >= backgrounds.size():
			spawn_background(next_needed)
		

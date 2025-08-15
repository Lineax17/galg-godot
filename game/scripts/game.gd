extends Node2D
	
const LEVELDIRECTORY = "res://levels/"

var current_level: Node = null
var current_level_number: int = 1

func _ready() -> void:
	load_level("level1.tscn")

func load_level(filename: String) -> void:
	# Remove old level if exists
	if current_level and is_instance_valid(current_level):
		current_level.queue_free()

	# Load new level
	var scene: PackedScene = load(LEVELDIRECTORY + filename)
	if scene:
		PathLookup.get_player().position = Vector2(0,0)
		PathLookup.get_camera().position = Vector2(0,0)
		
		# needed for player reset to complete
		await get_tree().process_frame
		
		var scene_instance = scene.instantiate()
		current_level = scene_instance
		get_tree().root.get_node("Game").add_child(scene_instance)
		
	else:
		push_error("Level konnte nicht geladen werden: " + filename)

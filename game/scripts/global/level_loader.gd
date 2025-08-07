extends Node

const LEVELDIRECTORY = "res://levels/"

var current_level: Node = null
var current_level_number: int = 1

func load_level(filename: String) -> void:
	# Remove old level if exists
	if current_level and is_instance_valid(current_level):
		current_level.queue_free()

	# Load new level
	var scene: PackedScene = load(LEVELDIRECTORY + filename)
	if scene:
		var scene_instance = scene.instantiate()
		current_level = scene_instance
		get_tree().root.get_node("Game").add_child(scene_instance)
	else:
		push_error("Level konnte nicht geladen werden: " + filename)

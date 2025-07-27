extends Node

const LEVELDIRECTORY = "res://levels/"

func load_level (filename: String) -> void:
	var scene : PackedScene = load(LEVELDIRECTORY + filename)
	var scene_instance = scene.instantiate()
	get_tree().root.get_node("Game").add_child(scene_instance)

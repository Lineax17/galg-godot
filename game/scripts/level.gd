extends Node2D

var filename 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player hit the level border")

		var loader = get_node("/root/LevelLoader")
		loader.current_level_number += 1
		var next_filename = "level" + str(loader.current_level_number) + ".tscn"
		loader.load_level(next_filename)

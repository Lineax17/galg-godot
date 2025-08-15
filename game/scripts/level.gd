extends Node2D

var filename 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player hit the level border")

		var game = get_node("/root/Game")
		game.current_level_number += 1
		var next_filename = "level" + str(game.current_level_number) + ".tscn"
		call_deferred("call_load", game, next_filename)

func call_load(game, file_name):
	game.load_level(file_name)
	

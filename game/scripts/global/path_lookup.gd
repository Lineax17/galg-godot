extends Node

var absolute_player_path : String = "Game/Player"

func get_player():
	return get_node("../" + absolute_player_path)

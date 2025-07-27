extends Node

var absolute_player_path : String = "Game/AutoScrollCamera/Player"

func get_player():
	return get_node("../" + absolute_player_path)

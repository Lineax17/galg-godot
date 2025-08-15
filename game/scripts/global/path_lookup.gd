extends Node

var absolute_player_path : String = "Game/AutoScrollCamera/Player"
var absolute_camera_path : String = "Game/AutoScrollCamera"

func get_player():
	return get_node("../" + absolute_player_path) as CharacterBody2D

func get_camera():
	return get_node("../" + absolute_camera_path) as Camera2D

extends Area2D

const DIRECTION_RIGHT : Vector2 = Vector2 (-1, 1)
const DIRECTION_LEFT : Vector2 = Vector2 (1, 1)

@export var speed = 100.0
var state = "right"


func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta):
	if state == "right":
		position = position + (DIRECTION_RIGHT * delta * speed)
	elif state == "left":
		position = position + (DIRECTION_LEFT * delta * speed)

func _on_body_entered(body):
	if body.is_in_group("walls"):
		print("Gem: Collided with walls")
		change_directon()

func change_directon():
	if state == "right":
		state = "left"
	else:
		state = "right"

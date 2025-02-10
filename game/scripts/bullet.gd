extends Area2D

const DIRECTION : Vector2 = Vector2 (0,-1)

@export var SPEED : float = 400.0

func _physics_process(delta: float) -> void:
	position = position + (DIRECTION * delta * SPEED)
	
func init(position: Vector2) -> void:
	self.position = position

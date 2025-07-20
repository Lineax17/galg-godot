extends CharacterBody2D

@export var movement_speed : float = 100.0

func _physics_process(delta):
	velocity = Vector2(0, movement_speed)
	move_and_slide()

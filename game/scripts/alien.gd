extends AnimatedSprite2D

@export var movement_speed : float = 500
var character_direction : Vector2

#func _physics_process(delta):
	#velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
	#move_and_slide()

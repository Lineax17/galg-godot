extends Camera2D

@export var scroll_speed : float = 100
@export var direction : Vector2 = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	position += direction * delta * scroll_speed

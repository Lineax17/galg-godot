extends Area2D

const DIRECTION : Vector2 = Vector2 (0,-1)

@export var speed : float = 500.0
@export var time_to_live : int = 5

var timer = 0.0

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta: float) -> void:
	timer = timer + delta
	
	position = position + (DIRECTION * delta * speed)
	
	#destruction of bullet
	if(timer > time_to_live):
		self.queue_free()
	
func init(position: Vector2) -> void:
	self.position = position

func _on_body_entered(body):
	print("Bullet: Hit ", body.name)
	if body.is_in_group("destructible"):
		print("Destructible object recognized: " + body.name)
		body.queue_free()
		self.queue_free()
	self.queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("Bullet: Hit ", area.name)
	if area.is_in_group("destructible"):
		print("Destructible object recognized: " + area.name)
		area.queue_free()
		self.queue_free()

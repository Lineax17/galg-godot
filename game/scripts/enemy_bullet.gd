extends Area2D

const DIRECTION : Vector2 = Vector2 (0,1)

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
	print("getroffen:", body.name)
	if body.is_in_group("player"):
		print("Zerstörbares Objekt erkannt")
		print("Spieler wurde getroffen")
		self.queue_free()

extends CharacterBody2D

@export var movement_speed : float = 500
@export var bullet : PackedScene
@export var bullet_cooldown = 1.0

var character_direction : Vector2
var timer = 0.0

func _physics_process(delta):
	timer = timer + delta

	#apply movement
	if character_direction:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		
	move_and_slide()

func shoot():
	var bullet_instance = bullet.instantiate()
	bullet_instance.init(position)
	EntityManager.add_child(bullet_instance)
	
func _input(InputEvent):
	if(Input.is_action_pressed("shoot") && (timer >= bullet_cooldown)):
		shoot()
		timer = 0.0
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	character_direction = character_direction.normalized()

extends CharacterBody2D

@export var movement_speed : float = 100.0
@export var side_speed : float = 35.0
# cooldown
@export var down_time : float = 3.0
@export var pause_time : float = 1.0  
@export var side_time : float = 3.0  

@export var enemy_bullet : PackedScene

var sidespeed_direction = "right"
var state = "down"
var timer = 0.0

func _physics_process(delta):
	timer += delta

	if state == "down":
		velocity = Vector2(0, movement_speed)
		if timer >= down_time:  
			state = "pause"
			timer = 0.0

	elif state == "pause":
		velocity = Vector2.ZERO
		if timer >= pause_time:
			shoot()
			state = "side"
			randomize_side_direction()
			timer = 0.0

	elif state == "side":
		if (sidespeed_direction == "left"):
			velocity = Vector2(side_speed * -1, 0)
		else:
			velocity = Vector2(side_speed, 0)
		if timer >= side_time:
			state = "down"
			timer = 0.0

	move_and_slide()

func shoot():
	var bullet_instance = enemy_bullet.instantiate()
	bullet_instance.init(position)
	EntityManager.add_child(bullet_instance)
	

func randomize_side_direction():
	if (randi() % 2 == 0):
		sidespeed_direction = "left"
	else:
		sidespeed_direction = "right"

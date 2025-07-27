extends CharacterBody2D

@export var movement_speed : float = 100.0
@export var enemy_bullet : PackedScene

@export var down_time : float = 5.0
@export var pause_time : float = 1.0  

var i = 0
var state = "down"
var timer = 0.0


func _physics_process(delta):
	timer += delta
	if state == "down":
		velocity = Vector2(movement_speed * sin(i), movement_speed)
		i += 0.1		
		if timer >= down_time:  
			state = "pause"
			timer = 0.0
	elif state == "pause":
		velocity = Vector2(0, movement_speed * -0.5)
		if timer >= pause_time:
			shoot()
			state = "down"
			timer = 0.0
	move_and_slide()
	
	
func shoot():
	var bullet_instance = enemy_bullet.instantiate()
	bullet_instance.init(position)
	EntityManager.add_child(bullet_instance)
	

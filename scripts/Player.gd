extends KinematicBody2D

const MOVE_SPEED = 200
var velocity = Vector2()

func _ready():
	pass

func get_input():
	if Input.is_action_just_pressed("player_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("player_right"):
		velocity.x += 1
	if Input.is_action_just_released("player_left")\
	|| Input.is_action_just_released("player_right"):
		velocity.x = 0
	velocity = velocity.normalized() * MOVE_SPEED
	if Input.is_action_just_released("player_shoot"):
		var projectile = load("res://scenes/Projectile.tscn").instance()
		var pos = position
		pos.y-=35
		projectile.position = pos
		get_node("../Projectiles").add_child(projectile)

func _physics_process(delta):
	get_input()
	move_and_collide(velocity*delta)
extends "res://scripts/Enemy.gd"

func _ready():
	velocity = Vector2(1,0)
	pos = position
	shoot()

func shoot():
	while(true):
		var projectile = load("res://scenes/EnemyProjectile.tscn").instance()
		var pos = position
		pos.y+=100
		projectile.position = pos
		get_parent().get_node("../Projectiles").add_child(projectile)
		#5sec
		yield(get_tree().create_timer(2.9), "timeout")
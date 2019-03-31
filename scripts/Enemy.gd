extends KinematicBody2D

const MOVE_SPEED = 75
var velocity = Vector2()
var pos = Vector2()
var row_index = 0

func hit():
	self.queue_free()

func _ready():
	velocity = Vector2(1,0)
	pos = position
	
func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized()*MOVE_SPEED*delta)
	if collision:
		var Controller = get_parent().get_parent().get_child(0)
		if collision.collider.name == "BorderRight":
			Controller.move_row(false)
		if collision.collider.name == "BorderLeft":
			Controller.move_row(true)
		if collision.collider.has_method("is_projectile"):
			hit()
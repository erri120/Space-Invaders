extends KinematicBody2D

const MOVE_SPEED = 100
var velocity = Vector2(0,1)

func is_projectile():
	return true

func _ready():
	pass

func _physics_process(delta):
	if(position.y>300):
		#get_parent().remove_child(self) also works
		self.queue_free()
	var collision = move_and_collide(velocity.normalized()*MOVE_SPEED*delta)
	if collision:
		if(collision.collider.has_method("reduce_hp")):
			collision.collider.reduce_hp()
			self.queue_free()
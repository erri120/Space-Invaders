extends KinematicBody2D

const MOVE_SPEED = 200
var velocity = Vector2(0,-1)

func _ready():
	pass

func _physics_process(delta):
	if(position.y<-300):
		#get_parent().remove_child(self) also works
		self.queue_free()
	move_and_collide(velocity.normalized()*MOVE_SPEED*delta)
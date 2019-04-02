extends StaticBody2D

const STARTHP = 100
var current_hp = 0
export (int) var damage_on_hit = 20

func _ready():
	current_hp = STARTHP
	
func reduce_hp():
	current_hp-=damage_on_hit
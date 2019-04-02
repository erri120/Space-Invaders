extends Node

export (Vector2) var start_pos = Vector2(-350,-250)
export (int) var distance_x = 64
export (int) var distance_y = 64
export (int) var rows = 4
export (int) var cols = 8

var field=[]

func move_row(left):
	for i in range (0, rows):
		for j in range (0, cols):
			field[i][j].position.y+=64
			if(left):
				field[i][j].velocity.x=1
			else:
				field[i][j].velocity.x=-1

func _ready():
	var pos = start_pos
	for i in range (0,rows):
		field.append([])
		field[i].resize(cols)
		for j in range (0,cols):
			var enemy = null
			if(i<rows/2):
				enemy = load("res://scenes/Enemy01.tscn").instance()
			else:
				enemy = load("res://scenes/Enemy02.tscn").instance()
			enemy.position = pos
			enemy.row_index = i
			field[i][j] = enemy
			get_node("../Enemies").add_child(enemy)
			pos = Vector2(pos.x+distance_x,pos.y)
		pos = Vector2(start_pos.x,pos.y+distance_y)
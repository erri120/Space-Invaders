extends Node

func show_group(tree,group):
	for i in tree.get_nodes_in_group(group):
		i.show()

func hide_group(tree,group):
	for i in tree.get_nodes_in_group(group):
		i.hide()

func change_scene(scene):
	var path = "res://scenes/"
	get_tree().change_scene(path+scene)
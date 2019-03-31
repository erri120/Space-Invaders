extends Button

export (bool) var hide = false
export (bool) var show = false
export (bool) var change = false
export (bool) var quit = false
export (String) var hide_group = ""
export (String) var show_group = ""
export (String) var scene = ""

func _pressed():
	if(hide):
		Global.hide_group(get_tree(),hide_group)
	if(show):
		Global.show_group(get_tree(),show_group)
	if(change):
		Global.change_scene(scene)
	if(quit):
		get_tree().quit()
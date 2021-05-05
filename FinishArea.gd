extends Area2D


export(String, FILE, ".tscn") var levelScene

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Character":
			get_tree().change_scene(levelScene)

extends Node


export (PackedScene) var LightScene


export (Vector2) var extra = Vector2(0, 0)


func _ready():
	call_deferred("add_light")


func add_light():
	var new_light = LightScene.instance()
	var parent = get_parent()
	new_light.target = parent
	new_light.extra = extra
	new_light.position = parent.position
	parent.get_parent().get_parent().get_parent().add_child(new_light)
	
	queue_free()

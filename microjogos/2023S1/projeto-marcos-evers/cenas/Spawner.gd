extends Node

@export var obstaculo_scene: PackedScene
var _parent

func _ready():
	_parent = get_parent()


func _on_spawn_timer_timeout():
	var obstaculo = obstaculo_scene.instantiate()
	
	obstaculo.position.x = _parent.WIDTH
	obstaculo.position.y = lerp(10, _parent.HEIGHT - 10, randf_range(0, 1))
	
	obstaculo.body_entered.connect(_parent._on_hit)
	
	add_child(obstaculo)

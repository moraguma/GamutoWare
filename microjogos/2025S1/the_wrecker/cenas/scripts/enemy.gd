extends CharacterBody2D

@onready var anim_tree: AnimationTree = $AnimationTree

var timer

func _on_timer_timeout() -> void:
	anim_tree.set("parameters/conditions/overtime", true)
	get_parent().register_lose()
	print("perdeu")
func _ready():
	timer = get_node("Timer")
	timer.start(5)
	
	
	

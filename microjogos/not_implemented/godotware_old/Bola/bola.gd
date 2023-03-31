extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
@onready var ponto = get_parent().get_node("ar")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var ponto = get_node("ar")
	get_node("AnimatedSprite2D").play("Zero")
	set_process(true)
	pass

func _process(delta):
	if ponto.click == 4:
		get_node("AnimatedSprite2D").play("Um")
	if ponto.click == 8:
		get_node("AnimatedSprite2D").play("Dois")
	if ponto.click == 12:
		get_node("AnimatedSprite2D").play("Três")
	if ponto.click == 16:
		get_node("AnimatedSprite2D").play("Quatro")
		get_parent().pause_timer()
		get_node("Timer").connect("timeout",Callable(get_parent(),"on_timeout"))
		get_node("Timer").start()
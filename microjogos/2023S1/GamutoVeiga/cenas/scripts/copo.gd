extends Sprite2D

@export var origin_pos_x: float

@onready var pos_almejada = Vector2(origin_pos_x, 555)


func _process(delta):
	position = lerp(position, pos_almejada, 0.1)


func mover_para(nova_pos):
	pos_almejada = nova_pos


func subir():
	pos_almejada = Vector2(position.x, 455)

func descer():
	pos_almejada = Vector2(origin_pos_x, 555)

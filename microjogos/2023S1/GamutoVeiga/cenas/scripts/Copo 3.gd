extends Sprite2D


var pos_almejada_3 = Vector2(1250, 554.932)


func _process(delta):
	position = lerp(position, pos_almejada_3, 0.1)


func mover_para(nova_pos):
	pos_almejada_3 = nova_pos


func subir():
	pos_almejada_3 = Vector2(position.x, 454.932)

func descer():
	pos_almejada_3 = Vector2(1250, 554.932)

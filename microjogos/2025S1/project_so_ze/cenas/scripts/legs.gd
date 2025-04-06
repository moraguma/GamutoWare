extends Sprite2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("baixo") and get_node("../").randomized_index == get_node("../").legs_index:
		get_node("../").legs = true
		get_node("../").randomized_index += 1
		get_node("../AnimationLegs").play("legs")
		frame = 5
	elif Input.is_action_just_pressed("baixo") and get_node("../").randomized_index != get_node("../").legs_index:
		get_node("../").fail = true
		get_node("../Fail").show()
		get_node("../..").register_lose()

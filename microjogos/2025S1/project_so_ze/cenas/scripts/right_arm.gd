extends Sprite2D

func _ready() -> void:
	frame = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("direita") and get_node("../").randomized_index == get_node("../").rarm_index:
		get_node("../").rarm = true
		get_node("../").randomized_index += 1
		get_node("../AnimationRightArm").play("right_arm")
	elif Input.is_action_just_pressed("direita") and get_node("../").randomized_index != get_node("../").rarm_index:
		get_node("../").fail = true
		get_node("../Fail").show()
		get_node("../../").register_lose()
		

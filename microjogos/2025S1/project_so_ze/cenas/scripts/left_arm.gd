extends Sprite2D

func _ready() -> void:
	frame = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esquerda") and get_node("../").randomized_index == get_node("../").larm_index:
		get_node("../").larm = true
		get_node("../").randomized_index += 1
		get_node("../AnimationLeftArm").play("left_arm")
	elif Input.is_action_just_pressed("esquerda") and get_node("../").randomized_index != get_node("../").larm_index:
		get_node("../").fail = true
		get_node("../Fail").show()
		#get_node("../..").register_lose()

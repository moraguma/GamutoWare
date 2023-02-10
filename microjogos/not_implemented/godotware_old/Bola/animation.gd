extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var click = 0


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass

func _process(delta):
	if( get_global_mouse_pos().x <= get_node(".").get_global_pos().x + 70
	and get_global_mouse_pos().x >= get_node(".").get_global_pos().x - 70
	and get_global_mouse_pos().y <= get_node(".").get_global_pos().y + 70
	and get_global_mouse_pos().y >= get_node(".").get_global_pos().y - 70
	):
		if Input.is_action_pressed("left_mouse_button") and (click == 0):
			get_node(".").play("Segundo")
			click += 1
		if Input.is_action_pressed("left_mouse_button") and (click == 1):
			get_node(".").play("Terceiro")
			click += 1
		if Input.is_action_pressed("left_mouse_button") and (click == 2):
			get_node(".").play("Quarto")
			click += 1
		if Input.is_action_pressed("left_mouse_button") and (click == 3):
			get_node(".").play("Quinto")
			click += 1

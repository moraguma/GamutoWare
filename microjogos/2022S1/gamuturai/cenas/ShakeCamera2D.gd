extends Camera2D

export var frequencia = 0.8
export var max_offset = Vector2(100,75)
export var max_roll = 0.1
export (NodePath) var alvo

var trauma = 0.0
var trauma_power = 2

func _ready():
	randomize()

func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)
	
func _process(delta):
	if Input.is_action_just_pressed("acao"):
		trauma = max(trauma - frequencia * delta, 0)
		shake()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

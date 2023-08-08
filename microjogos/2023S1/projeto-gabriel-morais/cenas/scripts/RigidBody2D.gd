extends RigidBody2D


# Called when the node enters the scene tree for the first time.


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("acao"):
#		hide()
		position = get_node("../personagem").position
		linear_velocity = Vector2(-10, 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

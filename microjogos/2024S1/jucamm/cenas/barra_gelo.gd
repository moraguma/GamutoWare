extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 9
	pass # Replace with function body.

func _physics_process(delta):
	var colisao = get_colliding_bodies()
	for i in colisao:
		print (colisao[0])
		if i.is_in_group ("area"):
			emit_signal("lose")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

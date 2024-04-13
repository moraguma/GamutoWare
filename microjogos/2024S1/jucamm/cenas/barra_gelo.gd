extends RigidBody2D


@onready var main = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 9
	pass # Replace with function body.

func _physics_process(delta):
	var colisao = get_colliding_bodies()
	for i in colisao:
		if i.is_in_group ("area"):
			main.register_lose()
	
	if len(colisao) > 0:
		$Bounce.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

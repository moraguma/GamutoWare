extends Camera2D

@onready var gam = $"/root/Sala-principal/gamuto"
@onready var gam_pos = gam.position

func _process(delta):
	position = gam_pos

	
	
	

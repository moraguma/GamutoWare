extends Camera2D

onready var player = get_node("../Player")
const ACCEL = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	position = player.position
	
func _process(delta):
	position = position.linear_interpolate(player.position, min(ACCEL*delta, 1))

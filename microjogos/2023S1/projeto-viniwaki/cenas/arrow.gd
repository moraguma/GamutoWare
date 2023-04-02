extends Sprite2D

var correct_rotation
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	


func _physics_process(_delta):
	correct_rotation = 
	rotation = deg_to_rad(correct_rotation) - get_node("..").rotation

extends Sprite2D

var correct_rotation = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func set_correct_rotation(rot):
	correct_rotation = rot


func _physics_process(_delta):
	#position = get_node("../rigid_body").global_position + Vector2(100, 0)
	rotation = correct_rotation - get_parent().rotation

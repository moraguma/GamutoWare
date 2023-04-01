extends RigidBody2D

var speed = 300;
@onready var mira = $"../player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_input():
	if Input.is_action_pressed("ui_select"):
		apply_central_impulse(Vector2(mira.position.x,-300))
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
	pass

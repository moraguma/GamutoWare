extends RigidBody2D
var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity*delta 
	
func _on_body_entered(body):
	body.velocity.y=0
	body.reparent(self)
	pass # Replace with function body.



func _on_area_2d_body_entered(body):
	body.velocity.y=0
	pass # Replace with function body.

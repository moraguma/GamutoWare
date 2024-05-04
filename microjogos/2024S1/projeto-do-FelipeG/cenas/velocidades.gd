extends RigidBody2D
var velocity = Vector2(0,0)

signal sorvete_contacted(node: Node)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity*delta 
	
func _sorvete_contacted(body):
	sorvete_contacted.emit(self)

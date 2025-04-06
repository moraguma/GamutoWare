extends CharacterBody2D

var vel_gamuto = 1000

func _physics_process(delta):
	velocity.y += 20
	print(velocity.y)
	move_and_slide()
func _ready():
	velocity.x = vel_gamuto
	velocity.y = -vel_gamuto
	

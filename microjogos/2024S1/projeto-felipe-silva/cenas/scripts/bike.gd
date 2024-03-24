extends CharacterBody2D
class_name Bike

var going_ltr: bool
func _ready():
	going_ltr = randi() % 2
	position.x = -880 if going_ltr else 880
	scale.x = -1 if going_ltr else 1

func _physics_process(_delta):
	velocity.x = 1000 if going_ltr else -1000
	move_and_slide()

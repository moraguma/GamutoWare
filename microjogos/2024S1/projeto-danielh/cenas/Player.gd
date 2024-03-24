extends CharacterBody2D


var speed = 1000	
var negspeed = -speed

var end = false

# Called when the node enters the scene tree for the first time.


func _ready():
	 # Replace with function body.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass 

	
func _physics_process(_delta):
	
	if Input.is_action_pressed("cima"):
		velocity.y = negspeed
		
	elif Input.is_action_pressed("baixo"):
		velocity.y = speed
		
	elif Input.is_action_pressed("direita"):
		velocity.x = speed
		
	elif Input.is_action_pressed("esquerda"):
		velocity.x= negspeed
		
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func _on_area_2d_body_entered(body):
		
	emit_signal("win")
	

	

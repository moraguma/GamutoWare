extends CharacterBody2D


const SPEED = 700.0   
var perdeu = false
func _ready():
	velocity = Vector2(SPEED, 0)

func _physics_process(delta): 
	var directionHorizontal = Input.get_axis("ui_left", "ui_right")
	var directionVertical = Input.get_axis("ui_down", "ui_up")
 
	if is_on_floor() or is_on_ceiling() or is_on_wall():
		perdeu = true
	if not perdeu:
		if velocity.y == 0:
			if(directionVertical > 0 ):
				velocity = Vector2(0, -SPEED)
			if(directionVertical < 0 ):
				velocity = Vector2(0, SPEED)
		if velocity.x == 0:
			if(directionHorizontal > 0 ):
				velocity = Vector2(SPEED, 0)
			if(directionHorizontal < 0 ):
				velocity = Vector2(-SPEED, 0)
	

	move_and_slide()
	
 

 

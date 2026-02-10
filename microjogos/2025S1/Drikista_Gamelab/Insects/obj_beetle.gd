extends Area2D

# Movement range variables
var distance = 382.5
var start_point = 960 - distance
var speed = 900
var direction = 1
var bb = false
var let = 0
var win_beetle = 0

#var check_position = get_node("../Scene/Plate").global_position

var sprite: Sprite2D

func _ready():
	sprite = $spr_beetle

func _process(delta):
	
	if Input.is_action_just_pressed("cima"):
		if bb && let == 0 :
			speed = 0
			win_beetle = 1
			let += 1
			get_parent().contar()
		elif bb == false:
			position.x = start_point
	
	#if Input.is_action_just_pressed("acao"):
		#position.x = start_point
		#speed = 900
	
	position.x += speed * direction * delta
	
	# limits
	if abs(position.x - 960) > distance:
		direction = direction * -1
		sprite.flip_h = not sprite.flip_h


# boolean
func _on_plate_beetle_area_entered(area: Area2D) -> void:
	bb = true

func _on_plate_beetle_area_exited(area: Area2D) -> void:
	bb = false

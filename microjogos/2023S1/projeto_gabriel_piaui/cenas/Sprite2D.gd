extends Sprite2D


var cano = false
var coordenadas2 = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.area_entered.connect(_on_area_2d_area_entered)
	$Area2D.area_exited.connect(_on_area_2d_area_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cano == true:
		if Input.is_action_just_pressed("acao"):
			rotation_degrees += 90
			if rotation_degrees >= 180:  
				rotation_degrees -= 180
pass


func _on_area_2d_area_entered(area):
	cano = true
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	cano = false
	pass # Replace with function body.

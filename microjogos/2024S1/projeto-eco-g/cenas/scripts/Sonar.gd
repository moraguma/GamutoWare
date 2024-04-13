extends Area2D
var sonar_is_ready: bool = true
var sonar_duration = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed(("acao"))):
		sonar_is_ready = false
		$Timer.start()
		$AnimatedSprite2D.play("default")
		$CollisionPolygon2D.disabled = false
	
	if $Timer.time_left < 0.7:
		$CollisionPolygon2D.disabled = true

func _on_timer_timeout():
	sonar_is_ready = true


func _on_area_entered(area):
	area.detected()

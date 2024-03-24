extends Area2D

@export var speed = 700


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var timer = get_node("Timer")
	timer.start(4)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position += transform.x * speed * delta
	
	pass


func _duration_end():
	queue_free()
	pass # Replace with function body.


func _bullet_hit(body):
	if body.is_in_group("asteroids"):
		body.linear_velocity = Vector2(0,0)
		body.set_deferred("freeze", true)
		body.asteroid_destroy()
	queue_free()
	pass # Replace with function body.

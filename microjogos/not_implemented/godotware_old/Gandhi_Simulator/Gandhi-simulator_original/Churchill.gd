extends KinematicBody2D
var a = 0
var b = 0
var c = 0

func _ready():
	set_fixed_process(true)
	pass
func _fixed_process(delta):
	if c%80==0:
		randomize()
		c = randi()%30
		b = c%4
	
	if b ==0:
		move(Vector2(0,-6))
	if b == 1:
		move(Vector2(6,0))
	if b ==2:
		move(Vector2(0,6))
	if b ==3:
		move(Vector2(-6,0))
			
	c = c +1
	pass

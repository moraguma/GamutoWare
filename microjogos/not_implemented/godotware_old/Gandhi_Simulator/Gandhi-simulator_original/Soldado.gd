extends KinematicBody2D
var a = 0
var b = 0
var c = 0
var d = 1

func _ready():
#	set_fixed_process(true)
	add_to_group("inimigo")
	pass
func _fixed_process(delta):
	if d>0:
		if c%80==0:
			randomize()
			c = randi()%30
			b = c%4
		
		if b ==0:
			move(Vector2(0,-2))
		if b == 1:
			move(Vector2(2,0))
		if b ==2:
			move(Vector2(0,2))
		if b ==3:
			move(Vector2(-2,0))
				
		c = c +1
	d += 1
	pass
extends CharacterBody2D

const SPEED = 150.0
const WIDTH = 1920
const HEIGHT = 1080

var target = Vector2(0,0)

var exploded = false
var ignited = false
var intersect = false

func _ready():
	print("ok")
	position = Vector2(randi_range(0,WIDTH),randi_range(0,HEIGHT))
	


func _physics_process(delta):
	if(exploded):
		return
	var direction = (target-position).normalized();
	velocity = direction*SPEED

	move_and_slide()

func explode():
	print("explodiu", intersect)
	exploded = true
	$"SpriteCreeper".hide()
	$"SpriteExplosao".show()
	
	var pai = get_parent()
	
	pai.perdeu=pai.perdeu or intersect



func saiu(body):
	intersect = false
	print("saiu")
	pass # Replace with function body.


func entrou(body):
	intersect = true;
	print("entrou")
	pass # Replace with function body.

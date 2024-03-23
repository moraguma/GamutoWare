extends CharacterBody2D

const SPEED = 150.0
const WIDTH = 1920
const HEIGHT = 1080

var target = Vector2(0,0)

var exploded = false
var ignited = false
var intersect = false

func _ready():
	$"AnimationPlayer".play("Idle")
	#print("ok")
	position = Vector2(randi_range(0,WIDTH-1),randi_range(0,HEIGHT-1))
	


func _physics_process(delta):
	if(exploded):
		return
	var direction = (target-position).normalized();
	velocity = direction*SPEED

	move_and_slide()

func explode():
	#print("explodiu", intersect)
	exploded = true
	$"AnimationPlayer".play("Explosion")
	var pai = get_parent()
	
	pai.perdeu=pai.perdeu or intersect

func ignite():
	$"AnimationPlayer".play("Ignited")

func saiu(body):
	intersect = false
	#print("saiu")
	pass # Replace with function body.


func entrou(body):
	intersect = true;
	#print("entrou")
	pass # Replace with function body.

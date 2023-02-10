extends Sprite


const ACCEL = 0.2


var player = null
var stuck = true


onready var chain = $Chain
onready var animation_player = $AnimationPlayer


func _ready():
	chain.add_point(Vector2(0, 0))
	chain.add_point(Vector2(0, 0))


func _process(delta):
	if player:
		chain.points[1] = player.position - position


func _physics_process(delta):
	if not stuck:
		position = position.linear_interpolate(player.position, ACCEL)
		animation_player.play("air")
	else:
		animation_player.play("idle")


func release():
	stuck = false

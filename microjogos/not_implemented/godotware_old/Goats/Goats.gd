extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar

var alive = true
var waitTime = 0
var timer = 0
var sprite = 0

signal morreu

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	pass

func set_waitTime(wait):
	waitTime = wait/2 + (randf()*wait)
	timer = waitTime/2

func die():
	if alive:
		get_node("Sprite").set_frame(2)
		get_node("SamplePlayer").play("sleep")
		alive = false
		emit_signal("morreu")

func _process(delta):
	if alive:
		timer += delta
		if timer >= waitTime:
			timer = 0
			move(Vector2(25,0))
			if sprite == 0:
				sprite = 1
				get_node("Sprite").set_frame(1)
			elif sprite == 1:
				sprite = 0
				get_node("SamplePlayer").play("normal")
				get_node("Sprite").set_frame(0)
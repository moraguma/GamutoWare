extends Area2D

@onready var timer = $Timer
@onready var lingua = $LinguaSprite


func _ready():
	lingua = $LinguaSprite
	timer = $Timer
	timer.connect("timeout", esconder)
	timer.set_wait_time(0.3)
	timer.one_shot = true
	position = Vector2(0,-2000)


func _physics_process(delta):
	if Input.is_action_just_pressed("acao"):
		position = Vector2(0, -118)
		timer.start()
		lingua.show()


func esconder():
	position = Vector2(0, -2000)
	lingua.hide()

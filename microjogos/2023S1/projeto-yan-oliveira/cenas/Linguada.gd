extends Area2D

var lingua
var timer
var mosca
var tempo = 0
var key_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	lingua = $LinguaSprite
	timer = $Timer
	mosca = $Mosca
	timer.connect("timeout", esconder)
	timer.set_wait_time(0.3)
	timer.one_shot = true
	position = Vector2(0,-2000)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("acao"):
		position = Vector2(0, -115)
		timer.start()
		lingua.show()
		
		
func esconder():
	position = Vector2(0, -2000)
	lingua.hide()
		
	

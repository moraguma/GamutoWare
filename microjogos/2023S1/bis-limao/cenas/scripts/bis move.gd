extends Sprite2D

@export var is_lemon: bool
var area: Area2D
var movement = normal_movement

func _ready():
	# faz ele se matar depois de um tempo
	var timer = Timer.new()
	self.add_child(timer)
	timer.connect("timeout", time_to_go)
	timer.set_wait_time(2)
	timer.start()

func _physics_process(delta):
	movement.call()

func push():
	movement = push_movement

func normal_movement():
	position += Vector2(-20, 0)

func push_movement():
	position += Vector2(0, 22)
	if position.y > 900:
		self.queue_free()
		if not is_lemon:
			self.get_parent().register_lose("blue_eaten")

func time_to_go():
	if is_lemon:
		self.get_parent().register_lose("bye_lemon")
	self.queue_free()

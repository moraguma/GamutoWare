extends Area2D

@export var velocidade: float = 700.0

func _ready():
	var notifier = VisibleOnScreenNotifier2D.new()
	notifier.screen_exited.connect(queue_free)
	add_child(notifier)

func _physics_process(delta):
	position.x += velocidade * delta

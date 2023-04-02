extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = randf()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if wait_time == 0:
		wait_time = randf()
		start()

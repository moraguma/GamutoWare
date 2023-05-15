extends Timer
var target

func explode():
	#$"BarulhoExplosão".play()
	$Delay.start()
	pass

func ignite():
	pass

func hide():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	start(4.75)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

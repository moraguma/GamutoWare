extends Timer

var linguada

# Called when the node enters the scene tree for the first time.
func _ready():
	linguada = $../Linguada


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Timer == 0:
	hide

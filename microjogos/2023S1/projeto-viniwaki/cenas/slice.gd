extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func animate_once(dir):
	frame = 0
	rotation = ((dir - 1) * PI / 2) +  (3 * PI / 4)
	visible = true
	play("default", 3.5)

func _on_animation_finished():
	visible = false


func _on_animation_looped():
	visible = false

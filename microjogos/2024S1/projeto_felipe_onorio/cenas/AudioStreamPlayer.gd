extends AudioStreamPlayer

# dependencies:
# none

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_finished():
	play()
	pass # Replace with function body.

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func _on_area_2d_body_entered(body):
	if body != get_node("../Player"):
		body.get_node("..").remove_child(body)
		get_node("..").remove_child(self)

# small script to play and delete flash animation

extends Sprite2D

# first function called (just one time)
func _ready():
	get_node('Animation').play('fade_out') # start fade_out animation
	await get_node('Animation').finished # wait the animation to be finished
	queue_free() # delete the node
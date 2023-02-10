# small script to play and delete flare animation

extends Sprite

# first function called (just one time)
func _ready():
	get_node('Animation').play('fade_out') # start fade_out animation
	yield(get_node('Animation'), 'finished') # wait the animation to be finished
	queue_free() # delete the node
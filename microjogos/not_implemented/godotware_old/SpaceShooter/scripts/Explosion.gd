# this script implements explosion behaviour

extends Sprite2D

# first function called (just one time)
func _ready():
	randomize() # make randomness works
	set_rotd(randf_range(0, 360)) # randomly rotates the node
	
	get_node('Smoke').set_emitting(true) # emit smoke effect
	get_node('Flare').set_emitting(true) # emit flare effect
	get_node('Animation').play('fade_out') # start fade_out animation
	
	global.main_node.get_node('Camera3D').shake(8, 0.25)
	
	global.main_node.get_node('Audio_Player').play('explosion') # play explosion sound
	
	await get_node('Animation').finished # wait Animation to end
	queue_free() # delete the node
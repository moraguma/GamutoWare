# this script implements ship's laser behaviour

# extends laser script
extends 'res://minigames/SpaceShooter/scripts/Laser.gd'

# first function called (just one time)
func _ready():
	connect('area_enter', self, '_on_area_enter') # if something collides to the node, calls _on_area_enter
	global.main_node.get_node('Audio_Player').play('laser_ship') # play laser_ship sound

# when something is colliding...
func _on_area_enter(other):
	if other.is_in_group('Enemy'): # if that thing is in group Enemy...
		other.armor -= 1 # the thing's armor is decreased,
		create_flare() # a flare is created,
		global.main_node.get_node('Camera').shake(4, 0.15)
		queue_free() # and the laser is deleted
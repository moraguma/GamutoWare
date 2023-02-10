# this script implements enemy's laser behaviour

# extends Laser script
extends 'res://minigames/SpaceShooter/scripts/Laser.gd'

# first function called (just one time)
func _ready():
	connect('area_enter', self, '_on_area_enter') # if something collides to the node, calls _on_area_enter
	global.main_node.get_node('Audio_Player').play('laser_enemy') # play laser_enemy sound

# when something is colliding...
func _on_area_enter(other):
	if other.is_in_group('Ship'): # if that thing is in group Ship...
		other.armor -= 1 # the thing's armor is decreased,
		create_flare() # a flare is created,
		global.main_node.get_node('Camera').shake(6, 0.15)
		queue_free() # and the laser is deleted
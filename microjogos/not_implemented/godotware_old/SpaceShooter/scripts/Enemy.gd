# this script implements enemies' basic behaviour

extends Area2D

# declare enemy's speed and armor (life)
var speed = Vector2()
export var armor = 1 setget set_armor

# store explosion scene
const scn_explosion = preload('res://minigames/SpaceShooter/scenes/Explosion.tscn')

# first function called (just one time)
func _ready():
	set_process(true) # enable _process
	add_to_group('Enemy') # add to Enemy group
	connect('area_enter', self, '_on_area_enter') # if something collides, call the function _on_area_enter

# called every frame
func _process(delta):
	translate(speed * delta) # set it's position based on speed
	
	# if out of screen, delete the node
	if get_pos().y-16 >= global.view_size.height or \
		get_pos().y+16 <= 0 or \
		get_pos().x-16 >= global.view_size.width or \
		get_pos().x+16 <= 0:
			queue_free()

# when something is colliding...
func _on_area_enter(other):
	if other.is_in_group('Ship'): # if the thing it's collinding is in group Ship...
		other.armor -= 1 # decrease the thing's armor
		create_explosion() # create an explosion
		queue_free() # delete the enemy node

# updates armor value when it's damaged
func set_armor(new_value):
	if is_queued_for_deletion(): # prevents doubled explosions
		return 
	
	if new_value < armor: # if enemy got damaged...
		global.main_node.get_node('Audio_Player').play('hit_enemy') # play hit_enemy sound
		
	armor = new_value # armor is set to the given parameter
	
	if armor <= 0: # if it's armor (life) is 0 or less...
		create_explosion() # create explosion
		queue_free() # delete the enemy node

# creates explosion effect
func create_explosion():
	var explosion = scn_explosion.instance() # instanciate scn_explosion
	explosion.set_pos(get_pos()) # set the effect position to enemy's position
	global.main_node.add_child(explosion) # add it to main node
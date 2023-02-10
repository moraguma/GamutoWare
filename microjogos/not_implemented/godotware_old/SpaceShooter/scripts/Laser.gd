# this script implements laser's basic behaviour

extends Area2D

# export it's speed
export var speed = Vector2()

# store flash scene
const scn_flare = preload('res://minigames/SpaceShooter/scenes/Flare.tscn')

# first function called (just one time)
func _ready():
	set_process(true) # enable _process
	create_flare() # creates flare
	
	yield(get_node('Visibility_Notifier'), 'exit_screen') # wait until it's not visible
	queue_free() # delete the node

# called every frame
func _process(delta):
	translate(speed * delta) # apply it's movement

# create flare effect
func create_flare():
	var flare = scn_flare.instance() # instanciate scn_flare
	flare.set_pos(get_pos()) # set flare's position to laser's position
	global.main_node.add_child(flare) # add flare instance to main node
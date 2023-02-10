# this script sets the whole game behaviour, allowing it to start and end properly

# extends minigame.gd
extends "res://scripts/minigame.gd"

# set a winning sign, wich will inform if the user won or lost the game
signal minigame_end(win)

# first function called (just one time)
func _ready():
	# override minigame.gd set_process(true)
	# this makes the game start when the curtains are fully opened
	set_process(false)

# called every frame
func _process(delta):
	# if the ship is destroyed, then the player lost the game
	if not has_node('Ship'):
		emit_signal('minigame_end', false)

# function to be called when the curtains are fully opened
func start():
	.start()
	
	# start _process
	set_process(true)
	
	# spawn nodes
	get_node('Ship').set_process(true)
	get_node('Camera').make_current()
	
	# play background music
	get_node('Audio_Player').get_node('Stream_Player').play()
	
	# spawn more/less enemies based on game's difficulty
	for i in range(difficulty):
		get_node('Spawner_Enemy').spawn()
		yield(global.create_timer(0.4), 'timeout')

# function to be called on winning/losing
func stop():
	# stop backgorund music
	get_node('Audio_Player').get_node('Stream_Player').stop()
	
	# delete all nodes, except background, Audio_Player and Explosion
	for i in range(get_child_count()):
		if get_child(i).get_name() != 'Stars_0' and \
			get_child(i).get_name() != 'Stars_1' and \
			get_child(i).get_name() != 'Audio_Player' and \
			get_child(i).get_name() != 'Flash' and \
			get_child(i).get_name() != 'Explosion':
				get_child(i).queue_free()

	.stop()
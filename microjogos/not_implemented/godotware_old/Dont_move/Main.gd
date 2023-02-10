extends "res://scripts/minigame.gd"

#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes
signal minigame_end(win)

func _ready():
	#= MINIGAME SETUP =#
	#The command 'set_process(true)' is already called on base class _ready() function. It's not necessary to use it again.
	pass

func _input(event):
	if event.type == InputEvent.MOUSE_MOTION or event.type == InputEvent.MOUSE_BUTTON or event.type == InputEvent.KEY:
		emit_signal("minigame_end", false)

func _process(delta):
	#This is the main game loop. Implement your main mechanics here
	#To finish the game with a victory, use:
	#		emit_signal("minigame_end", true)
	#To finish the game with a defeat, use:
	#		emit_signal("minigame_end", false)
	#Be wary that timeouts may trigger defeat by default. You can change that by tweaking with TIMEOUT_WIN variable in setup
	pass

func start():
	#Be sure to only enable minigame elements in this method.
	set_process_input(true)
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass

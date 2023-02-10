extends "res://scripts/minigame.gd"

#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes
signal minigame_end(win)

onready var ratio = 1

func _ready():
	#= MINIGAME SETUP =#
	#The command 'set_process(true)' is already called on base class _ready() function. It's not necessary to use it again.
	pass

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
	ratio = OS.get_time_scale() # Ajusts character speed by increasing difficuty
	get_node("Personagem/Area2D").ratio = ratio
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass
	
func lost():
	emit_signal("minigame_end", false)

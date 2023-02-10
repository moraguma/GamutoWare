extends "res://scripts/minigame.gd"

#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes
signal minigame_end(win)

func _ready():
	#= MINIGAME SETUP =#
	
	DURATION = 4 + difficulty*0.5 # 4 seconds + 0.5 seconds for every dificulty level
	var green_bar = get_node("bargreen")
	if difficulty == 1:#Easy
		get_node("arrow/AnimationPlayer").play("Move",-1,0.9)
	elif difficulty == 2:#Medium
		get_node("arrow/AnimationPlayer").play("Move",-1,1.2)
	elif difficulty == 3:#Hard
		get_node("arrow/AnimationPlayer").play("Move",-1,1.4)
	elif difficulty == 3:#Insane
		get_node("arrow/AnimationPlayer").play("Move",-1,1.9)
	else:
		get_node("arrow/AnimationPlayer").play("Move",-1,1.5)# PRA TESTAR ISOLADO
	#The command 'set_process(true)' is already called on base class _ready() function. It's not necessary to use it again.

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

func _input(event):
	if (event.type == InputEvent.KEY):
		var xpos = get_node("arrow").get_pos().x
		print(xpos)
		if (xpos>=250 and xpos<=400):
			emit_signal("minigame_end", true)
		else:
			emit_signal("minigame_end", false)
		set_process_input(false)

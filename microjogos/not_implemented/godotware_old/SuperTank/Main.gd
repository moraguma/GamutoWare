extends "res://scripts/minigame.gd"

#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

var seguindo_mouse = false

# This signal is called when the minigame finishes
signal minigame_end(win)

func _ready():
	DURATION = 6.5
	#= MINIGAME SETUP =#
	#The command 'set_process(true)' is already called on base class _ready() function. It's not necessary to use it again.
	randomize()
	
	var filhos1 = get_node("Node2D").get_children()
	var filhos2 = get_node("Node2D2").get_children()
	var filhos3 = get_node("Node2D1").get_children()
	var random_1 = int(filhos1.size() * randf())
	var random_2 = int(filhos2.size() * randf())
	var random_3 = int(filhos3.size() * randf())
	var random_4 = int(filhos1.size() * randf())
	var random_5 = int(filhos2.size() * randf())
	var random_6 = int(filhos3.size() * randf())
	filhos1[random_1].queue_free()
	filhos1[random_4].queue_free()
	filhos2[random_2].queue_free()
	filhos2[random_5].queue_free()
	filhos3[random_3].queue_free()
	filhos3[random_6].queue_free()
	
	set_process(true)
	get_node("jogador").connect("mouse_enter", self, "mouse_chegou")
	get_node("jogador").connect("area_enter", self, "area_jogador")

func mouse_chegou():
	seguindo_mouse = true
	get_node("Mouse").hide()

func area_jogador(area):
	if area.get_name() == "final":
		emit_signal("minigame_end", true)
		get_node("final").hide()
	else:
		emit_signal("minigame_end", false)

func _process(delta):
	if(seguindo_mouse == true):
		get_node("jogador").set_pos(get_viewport().get_mouse_pos())

func start():
	#Be sure to only enable minigame elements in this method.
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass
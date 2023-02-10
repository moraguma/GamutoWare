extends "res://scripts/minigame.gd"

# Feito por Henrique Finger Zimerman

#=== MINIGAME BOILERPLATE ===#

#-> Check inherited file scripts/minigame.gd for more details

# This signal is called when the minigame finishes

signal minigame_end(win)

var acabou_desgraca = false

var cabraCount = 0

var numCabras = 3

var resultado = false

func fim():
	get_node("Aim").hide()
	pause_timer()
	get_node("EndTimer").start()
	get_node("Flowers").queue_free()
	get_node("Goats").queue_free()
	

func _on_perdeu():
	if acabou_desgraca == false:
		acabou_desgraca = true
		resultado = false
		get_node("End").set_animation("Lose")
		get_node("SamplePlayer").play("normal")
		fim()
		
func _on_morreu():
	if acabou_desgraca == false:
		cabraCount += 1
		if cabraCount >= numCabras:
			acabou_desgraca = true
			resultado = true
			get_node("End").set_animation("Win")
			get_node("SamplePlayer").play("sleep")
			fim()
			
func _on_timeout():
	emit_signal("minigame_end", resultado)

func start():
	#Be sure to only enable minigame elements in this method.
	get_node("Aim").set_process(true)
	get_node("Aim").set_process_input(true)
	get_node("EndTimer").connect("timeout",self,"_on_timeout")
	var maior_tempo = 0
	for goat in get_node("Goats").get_children():
		goat.set_process(true)
		goat.connect("morreu", self, "_on_morreu")
		var defWait
		if difficulty == 1:
			defWait = 0.7
		elif difficulty == 2:
			defWait = 0.5
		elif difficulty == 3:
			defWait = 0.25
		else:
			defWait = 0.125
		goat.set_waitTime(defWait)
		if goat.waitTime > maior_tempo:
			maior_tempo = goat.waitTime
	DURATION = maior_tempo*13
	for flowerbed in get_node("Flowers").get_children():
		for flower in flowerbed.get_children():
			flower.set_process(true)
			if flower.get_name() == "FinalFlower":
				flower.connect("perdeu", self, "_on_perdeu")
	
	.start()
	pass

func stop():
	#Be sure to disable active minigame elements in this method.
	.stop()
	pass
extends Node2D

signal win
signal lose
 
const WIDTH = 1920
const HEIGHT = 1080

const MIN_X = 500
const MAX_X = 1700
const MIN_Y = 300
const MAX_Y = 700

var pontuacao = 0
var musica_tocada = false

 
func _ready(): 
	randomize()
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("Eat the Fruits!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("Coma as frutas!")
	var spawns = [ 
		{ "min": Vector2(500,300), "max": Vector2(1700,800) },
	]
	var miojos = [$Miojin1, $Miojin2, $Miojin3]
	for i in range(3):
		var spawn = spawns[0]
		miojos[i].position = Vector2(randf_range(spawn["min"].x,spawn["max"].x),randf_range(spawn["min"].y,spawn["max"].y))
		
func _process(delta):
	if $player.perdeu and not musica_tocada: 
		$lose.play()
		musica_tocada = true
 
func ganhar_ponto(body):
	pontuacao += 1
	if(pontuacao >= 3):
		register_win()
		$win.play()
		$player.acabou = true
	else:
		$mordida.play()

func register_win():
	emit_signal("win") 

func register_lose():
	emit_signal("lose")


 
		

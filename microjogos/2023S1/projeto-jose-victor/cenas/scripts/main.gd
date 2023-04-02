extends Node2D

signal win
signal lose
 
const WIDTH = 1920
const HEIGHT = 1080
var pontuacao = 0

 
func _ready(): 
	var random = RandomNumberGenerator.new()
	random.randomize()
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify("DO SOMETHING!")
		Global.LANGUAGE.PT:
			NotificationCenter.notify("FACA ALGO!")
	var spawns = [ 
		{ "min": Vector2(96,896), "max": Vector2(1760,992) },
		{ "min": Vector2(1760,208), "max": Vector2(1824,944) },
		{ "min": Vector2(96,96), "max": Vector2(1760,160) },
		{ "min": Vector2(96,208), "max": Vector2(160,944) }
	]
	var miojos = [$Miojin1, $Miojin2, $Miojin3, $Miojin4]
	for i in range(4):
		var spawn = spawns[i]  
		miojos[i].position = Vector2(random.randi_range(spawn.min.x,spawn.max.x),random.randi_range(spawn.min.y,spawn.max.y))
		

func _process(delta):
	print(pontuacao)

 
func ganhar_ponto(body):
	pontuacao += 1
	if(pontuacao >= 4):
		register_win()		


 
func register_win():
	emit_signal("win") 

func register_lose():
	emit_signal("lose")

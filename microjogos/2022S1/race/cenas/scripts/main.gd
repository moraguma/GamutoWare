extends Node2D


signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var winnable = true
var losable = true

func _ready():
	
	randomize()


func register_win():
	if(winnable):
		losable = false
		get_node("VictorySFX").play()
		emit_signal("win")

func register_lose():
	if(losable):
		winnable = false
		losable = false
		get_node("DefeatSFX").play()
		emit_signal("lose")

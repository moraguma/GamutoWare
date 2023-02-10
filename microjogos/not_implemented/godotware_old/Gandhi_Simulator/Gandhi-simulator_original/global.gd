extends Node

var playerpont = 0
var record = 0

func _ready():
	playerpont = 0
	set_process(true)
	pass
func _process(delta):
	if playerpont > record:
  		record = playerpont
	

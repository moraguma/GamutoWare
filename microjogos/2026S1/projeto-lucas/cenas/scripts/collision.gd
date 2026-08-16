extends Node

var nave
var lua
func _ready() -> void:
	nave = get_node("../Nave")
	lua = get_node("../Lua")

func _process(delta: float) -> void:
	if nave.get_last_slide_collision():
		var velocity = nave.velocity
		
		if velocity.length() >= 100: Minigames.register_lose(self)
		else: Minigames.register_win(self)

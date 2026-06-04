extends Area2D
var ganhou



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ganhou = true
	Minigames.register_win(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if has_overlapping_bodies():
	var lista = get_overlapping_bodies()
	print(lista)
	





func _on_timer_timeout() -> void:
	if ganhou == true:
		Minigames.register_win(self)
	else:
		Minigames.register_lose(self)

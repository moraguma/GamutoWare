extends Node2D

const SPAWN_POSITIONS = [
	Vector2(0, 0),
	Vector2(96, -592),
	Vector2(520, -8)
]

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	randomize()
	$Prision.play("Prision")
	$Gamuto.play("gamuto")
	$Player.position = SPAWN_POSITIONS[randi() % len(SPAWN_POSITIONS)]

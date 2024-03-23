extends Node2D

const green_text: Array[String] = [
	"Técnicas avançadas de gamutificação",
	"Gamuto: Herói ou chacota?",
	"Guambe: Um novo nome não esconde a verdade",
	"Gamux anuncia: Gamuto no Gamutoverso"
]

const red_text: Array[String] = [
	"Gamutas gamutaveis na sua área",
	"Já ouviu a palavra de Linux hoje?",
	"Rei Gamuto da Nigéria quer falar com você...",
	"CLIQUE AQUI PARA RECEBER [[2000]] GAMUTÓIDES!!!!!"
]

var is_red: bool = false
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# deletion
var deleting: bool = false
var horizontal_speed: float  = 300.0
var alpha_speed: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	is_red = false if rng.randi_range(0, 6) % 3 == 0 else true
	
	if is_red:
		var text_index: int = rng.randi_range(0, len(red_text) - 1)
		$Control/RichTextLabel.text = red_text[text_index]
	else:
		$Icon.region_rect.position.x = 32
		var text_index: int = rng.randi_range(0, len(green_text) - 1)
		$Control/RichTextLabel.text = green_text[text_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not deleting: return
	
	modulate.a -= alpha_speed * delta
	position.x += horizontal_speed * delta
	
	if modulate.a <= 0: queue_free()
	
func start_deletion(go_right: bool):
	deleting = true
	modulate.a = 0.75
	if not go_right: horizontal_speed *= -1


extends Area2D


const SHAKE_AMOUNT = 0.5
const MAX_OFFSET = Vector2(128, 128)


var noise_y = 0


@onready var noise = FastNoiseLite.new()
@onready var sprite = $SpriteMosca


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	noise.seed = randi()
	noise.frequency = 0.003
	
	area_entered.connect(tentar_deletar)
	#connect("area_entered", queue_free)


func tentar_deletar(area):
	queue_free()
	get_parent().mosca_morta += 1
	if get_parent().mosca_morta == 3:
		get_parent().register_win() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.offset[0] = MAX_OFFSET[0] * SHAKE_AMOUNT * noise.get_noise_1d(noise_y)
	sprite.offset[1] = MAX_OFFSET[1] * SHAKE_AMOUNT * noise.get_noise_1d(noise_y + 9999)
	
	noise_y += 1

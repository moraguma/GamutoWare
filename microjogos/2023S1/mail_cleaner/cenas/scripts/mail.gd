extends Sprite2D

@export var green_sprites: Array[Texture2D]
@export var red_sprites: Array[Texture2D]

var is_red = false
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_red:
		var index: int = rng.randi_range(0, len(red_sprites) - 1)
		texture = red_sprites[index]
	else:
		var index: int = rng.randi_range(0, len(green_sprites) - 1)
		texture = green_sprites[index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


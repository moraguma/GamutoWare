extends Sprite2D


@export var green_sprites: Array[Texture2D]
@export var red_sprites: Array[Texture2D]

var is_red = false
var rng = RandomNumberGenerator.new()

# deletion
var deleting = false
var horizontal_speed: float  = 30.0
var alpha_speed: float = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	is_red = false if rng.randi_range(0, 6) % 3 == 0 else true
	
	if is_red:
		var index: int = rng.randi_range(0, len(red_sprites) - 1)
		texture = red_sprites[index]
	else:
		var index: int = rng.randi_range(0, len(green_sprites) - 1)
		texture = green_sprites[index]

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


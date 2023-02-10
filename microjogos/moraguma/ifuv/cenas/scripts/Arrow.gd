extends Sprite


const RADIUS = 2
const FREQUENCY = 1.5


var time_elapsed = 0
var base_position


func _ready():
	base_position = position


func _process(delta):
	time_elapsed += delta
	position = base_position + Vector2(0, 1) * RADIUS * sin(FREQUENCY * time_elapsed)

extends Camera2D

@export var shake_intensity: float = 15.0
@export var shake_velocity: float = 2

var _noise := FastNoiseLite.new()
var _shake_time: float = 0.0

@onready
var progressBar = $Control/ProgressBar

func _ready() -> void:
	# Configure noise for smooth random movement
	_noise.seed = randi()
	_noise.frequency = 0.5

func _process(delta: float) -> void:
	# Update shake time
	_shake_time += delta
	shake_velocity = (progressBar.value - 18) / 10 + 2
	
	# Generate smooth noise-based offset
	var shake_offset = Vector2(
		_noise.get_noise_1d(_shake_time * shake_velocity),
		_noise.get_noise_1d(_shake_time * shake_velocity + shake_velocity)
	) * shake_intensity
	
	# Apply the offset to the camera
	offset = shake_offset

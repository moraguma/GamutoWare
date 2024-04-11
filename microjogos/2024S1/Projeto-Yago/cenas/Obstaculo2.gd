extends CharacterBody2D

@onready var path_find = $"../Path2D2/PathFollow2D"

const SPEED = 400.0

var colision = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	
	if colision:
		return
		
	if velocity.normalized() != Vector2.ZERO: #Rotação
		rotation = lerp_angle(rotation, deg_to_rad(90) + velocity.angle(), 0.3)

	velocity = self.global_position.direction_to(path_find.global_position) * SPEED #Velocidade
	
	if self.global_position.distance_squared_to(path_find.global_position) < 15:
		path_find.progress_ratio += 0.07	
	if path_find.progress_ratio > 0.95:
		queue_free()
		self.position = path_find.position
	
	if not colision and move_and_slide():
		NotificationCenter.notify("PERDEU PLAYBOY!")
		colision = true

extends CharacterBody2D

@export var target: CharacterBody2D
@export var detection_range: float = 2000.0
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 500.0

@onready var spawn_point := $Marker2D
@onready var sprite := $AnimatedSprite2D

@export var enabled := false

func spawn():
	$AnimationPlayer.play("spawn")
	enabled = true

func _process(delta):
	if target:
		# Rotate body to face target
		var direction = (target.global_position - global_position).normalized()
		rotation = direction.angle()

func shoot():
	if not bullet_scene or not enabled:
		return
			# Shoot if target is in range
	if global_position.distance_to(target.global_position) <= detection_range:
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		
		# Set bullet position and velocity
		bullet.global_position = spawn_point.global_position
		var direction = (target.global_position - spawn_point.global_position).normalized()
		bullet.linear_velocity = direction * bullet_speed
		sprite.play("Shot")

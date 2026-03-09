extends Area2D

@onready var reflected = false
var enemy = ""
var vel = 500
var velocity = Vector2(0, 0)

func setEnemy(e):
	enemy = e

func _physics_process(delta: float) -> void:
	
	velocity = Vector2(vel,0).rotated(rotation)
	position += velocity * delta

func _on_area_entered(area: Area2D) -> void:
	if area.name.contains("Enemy") and reflected:
		area.kill()
		queue_free()
	elif area.name == "SwordCollision":
		reflected = true
		rotate(PI)
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		body.kill()
		queue_free()

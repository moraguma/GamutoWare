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
		if area.name == "EnemyLeft":
			$"../EnemyLeft".kill()
		elif area.name == "EnemyUp":
			$"../EnemyUp".kill()
		elif area.name == "EnemyRight":
			$"../EnemyRight".kill()
		elif area.name == "EnemyDown":
			$"../EnemyDown".kill()
		queue_free()
	elif area.name == "SwordCollision":
		reflected = true
		if enemy == "EnemyLeft":
			look_at($"../EnemyLeft".position)
		elif enemy == "EnemyUp":
			look_at($"../EnemyUp".position)
		elif enemy == "EnemyRight":
			look_at($"../EnemyRight".position)
		elif enemy == "EnemyDown":
			look_at($"../EnemyDown".position)
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" :
		$"../Player".kill()
		queue_free()
	pass

extends Area2D

var direcao
@onready var arrow = preload("res://microjogos/2025S1/projeto_pedrovmc/cenas/arrow.tscn")

func _ready() -> void:
	init.call_deferred()

func init() -> void:
	if direcao == "Right":
		$EnemyAnimation.flip_h = true
	$EnemyAnimation.play("idle")

func setDirecao(dir) -> void:
	direcao = dir

func shoot() -> void:
	if direcao == "Right" or direcao == "Left":
		$EnemyAnimation.play("shoot")
	elif direcao == "Up":
		$EnemyAnimation.play("shoot_down")
	elif direcao == "Down":
		$EnemyAnimation.play("shoot_up")
	$Load.play()
	await $EnemyAnimation.animation_finished
	
	$EnemyAnimation.play("idle")

func kill() -> void:
	queue_free()

func _on_enemy_animation_frame_changed() -> void:
	if $EnemyAnimation.animation.contains("shoot") and $EnemyAnimation.frame == 6 :
		var new_arrow = arrow.instantiate()
		new_arrow.setEnemy(name)
		new_arrow.position = position
		new_arrow.look_at($"../Player".position)
		if direcao == "Up" or direcao == "Down": 
			new_arrow.vel = 400
		get_parent().add_child(new_arrow)

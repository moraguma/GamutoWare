extends Area2D

var direcao
@onready var arrow = preload("res://microjogos/2025S1/projeto_pedrovmc/cenas/arrow.tscn")

func _ready() -> void:
	init.call_deferred()

func init() -> void:
	if direcao == "Right":
		$EnemyAnimation.flip_h = true
	$EnemyAnimation.play("idle")
	pass

func setDirecao(dir) -> void:
	direcao = dir	
	pass

func shoot() -> void:
	if direcao == "Right" or direcao == "Left":
		$EnemyAnimation.play("shoot")
	elif direcao == "Up":
		$EnemyAnimation.play("shoot_down")
	elif direcao == "Down":
		$EnemyAnimation.play("shoot_up")
	
	await $EnemyAnimation.animation_finished
	
	$EnemyAnimation.play("idle")
	pass

func kill() -> void:
	queue_free()
	get_parent().register_win()
	pass

func _on_enemy_animation_frame_changed() -> void:
	if $EnemyAnimation.animation.contains("shoot") and $EnemyAnimation.frame == 6 :
		var new_arrow = arrow.instantiate()
		new_arrow.setEnemy(name)
		new_arrow.position = position
		new_arrow.look_at($"../Player".position)
		get_parent().add_child(new_arrow)
	pass # Replace with function body.

extends Node2D

@onready var abobora_scene = preload("res://microjogos/2025S1/projeto_milla/cenas/abobora.tscn")
@export var errors = 0
var lower_child : CharacterBody2D
var lower_position = 0

func _process(delta: float) -> void:
	lower_position = 0
	for child : CharacterBody2D in get_children().filter(func(node): return node is CharacterBody2D):
		if child.position.y > lower_position:
			lower_child = child
			lower_position = child.position.y
	if lower_child:
		lower_child.enable = true

func register_error():
	errors += 1
	if errors >= 3:
		get_parent().register_lose()

func _on_timer_timeout() -> void:
	var abobora_instance : CharacterBody2D = abobora_scene.instantiate()
	abobora_instance.position = Vector2(randf_range(70, 1850), randf_range(-100, -50))
	abobora_instance.direcao = randi_range(0,3)
	add_child(abobora_instance)


func _on_chão_body_entered(body: Node2D) -> void:
	body.queue_free()
	register_error()

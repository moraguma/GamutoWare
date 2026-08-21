extends Area2D

@export var enabled = false
@export var in_range = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("acao") and in_range:
		habilitar_desabilitar()

func habilitar_desabilitar():
	enabled = not enabled
	collision_layer = 1 if enabled else 2
	if enabled: 
		$Stop.set_modulate(Color(1,1,1,1))
	else: 
		$Stop.set_modulate(Color(1,1,1,0.7))


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = false

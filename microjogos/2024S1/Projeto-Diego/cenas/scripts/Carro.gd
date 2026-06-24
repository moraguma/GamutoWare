extends CharacterBody2D
@export var main : Node2D

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("carro") and body != self:
		crash()
		body.crash()
		
func crash():
	get_parent().stop = true
	main.register_lose()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("placa"):
		if area.enabled:
			get_parent().stop = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("placa"):
		if not area.enabled:
			get_parent().stop = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("carro") and body != self:
		$"237375SquarealCar-crash".play()

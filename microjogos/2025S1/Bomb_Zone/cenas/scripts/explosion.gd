extends Area2D

func _ready():
	$exSound.play()
	
#func _process(delta: float) -> void:
	#var obj = get_overlapping_bodies().filter(func(body): return body.is_in_group("Player"))
	#if len(obj) > 0:
		#obj[0].queue_free()
		#get_parent().get_parent().register_lose()
		#print("here")
#

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("here")
		get_parent().get_parent().register_lose()
		get_node("../../ROBO").queue_free()
	
	

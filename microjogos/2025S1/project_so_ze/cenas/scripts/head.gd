extends Sprite2D

func _ready() -> void:
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cima"):
		Player.head = true
		

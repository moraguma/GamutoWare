extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.set_deferred("disabled", true)



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	await 0.1
	$CollisionShape2D.set_deferred("disabled", false)
	

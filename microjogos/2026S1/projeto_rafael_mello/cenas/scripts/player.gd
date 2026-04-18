extends CharacterBody2D

@export var spd = 320;
var dir : Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity = Vector2.UP*100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	velocity.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima")
	
	velocity = velocity.normalized()*spd
	
	move_and_slide( )
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	Minigames.register_lose(self)
	queue_free()
	pass # Replace with function body.

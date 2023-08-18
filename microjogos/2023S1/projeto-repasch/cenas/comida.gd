extends Node2D

var speed = 600;
var comidas = [preload("res://microjogos/2023S1/projeto-repasch/recursos/hamburg.png"),preload("res://microjogos/2023S1/projeto-repasch/recursos/batata.png")]
signal comi

# Called when the node enters the scene tree for the first time.
func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var img = (randi() % 2)
	$Sprite2D.set_texture(comidas[img])
	pass # Replace with function body.

func _physics_process(delta):
	
	var dir = (Vector2(0,1)*1)
	var velocity = dir * speed
	position += velocity*delta
	#move_and_slide()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_entered(body):
	if body.has_method("soma_comida"):
		body.soma_comida()
		self.queue_free()
	pass # Replace with function body.

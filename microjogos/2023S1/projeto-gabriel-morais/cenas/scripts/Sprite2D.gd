extends Sprite2D
var caiu = 0
var speed = 0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if caiu == 1:
		position.y += speed*delta + (gravity*(delta**2))/2
		speed += gravity*delta
	pass



func _on_maca_1_body_entered(body):
	if get_node("../../pedra").foi_jogado == 1 and caiu != 1:
		caiu = 1
		get_node("../../../").num_mac += 1
		get_node("../../../").ganhou()

extends Area2D


var velocidade = Vector2(0, 0)
var sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("AnimatedSprite2D")
	sprite.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("direita"):
		velocidade.x= 500
	elif Input.is_action_pressed("esquerda"):
		velocidade.x= -500
	else:
		velocidade.x=0
	
	if Input.is_action_pressed("cima"):
		velocidade.y= -500
	elif Input.is_action_pressed("baixo"):
		velocidade.y= 500
	else:
		velocidade.y=0
	position+=velocidade*delta
			


func foi_atingido(area):
	sprite.animation="explosao"


func _on_animated_sprite_2d_animation_finished():
	print("você perdeu")
	if sprite.animation=="explosao":
		print("você perdeu!")
		get_parent().register_lose()
		get_tree().exit()


func _on_animated_sprite_2d_animation_looped():
	print("você perdeu")
	if sprite.animation=="explosao":
		print("você perdeu!")
		get_parent().register_lose()
		get_tree().exit()
	

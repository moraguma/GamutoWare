extends CharacterBody2D


const speed = 250
const size = 160
const floor = 860
const velY = 2500
const normalY = 520
var deathCounter = 0
var isPunching 
var time 

var screensize 

func _ready():
	screensize = get_viewport_rect().size
	isPunching = false
	position.y = normalY
	position.x = 1700

func _physics_process(delta):
	
	# MOVIMENTACAO
	
	if isPunching == false:
		if Input.is_action_pressed("direita"):
			velocity.x = speed
		elif Input.is_action_pressed("esquerda"):
			velocity.x = -speed
		else:
			velocity.x = 0
		move_and_slide()
		
		position += velocity * delta
		position.x = clamp(position.x, size/2, screensize.x-(size/2))
		
		if Input.is_action_pressed("acao") :
			
			isPunching = true
			velocity.x = 0
			velocity.y = velY;
			
		
	else:
		if position.y < normalY: 
				position.y = normalY
				isPunching = false
				velocity.y = 0
				
		if position.y > floor:
				velocity.y = -velY
			
	move_and_slide()	
	
	# ANALISAR SE TEVE COLISAO
	
func _on_area_2d_area_entered(area):
	var Sound = get_node("../SmashSound")
	Sound.play()
	
	var Hand = get_node("../DeathGod/CollisionShape2D/Sprite2D")
	Hand.texture = preload("res://microjogos/2023S1/projeto-thedeas/recursos/MaoSangue.png")
	
	deathCounter += 1
	
	if deathCounter == 5: 
		get_parent().register_win()
	
	area.queue_free()
	


extends CharacterBody2D
var pos = 0
var tentou = false
var tipos = ["lata", "sacola", "garrafa"]
@export var tipo : String
func _ready() -> void:
	tipo = tipos.get(randi_range(0,2))
	match tipo:
		"lata": $Lata.visible = true
		"sacola": $Sacola.visible = true
		"garrafa": $Garrafa.visible = true

func _physics_process(delta):
	if Input.is_action_just_pressed("esquerda"):
		pos -= 1
	if Input.is_action_just_pressed("direita"):
		pos += 1
	
	pos = clamp(pos, -1, 2)
	position.x = 1920/2 - 240 + 480 * pos
	if tentou:
		velocity.y += get_gravity().y * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("acao") and not tentou:
		tentou = true
		

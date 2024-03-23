extends CharacterBody2D
 
const TIME_PERIOD = 0.8
var time = 0
@onready var AguaSound = get_node("AguaSound")
@onready var BaleiaHit = get_node("baleiaHit")
@onready var background = get_node("background")
@onready var baleia_animacao = get_node("baleia_animacao")
@onready var baleia_morta = get_node("baleia_morta")
@onready var base = get_parent()
var vivo = true

func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("MATE A BALEIA")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("KILL THE WHALE")
	
	baleia_animacao.play("baleia")
	
func _on_Terra_body_entered(body):
	BaleiaHit.play()
	baleia_animacao.visible = false
	baleia_morta.visible = true
	vivo = false
	base.emit_signal("win")

func _on_agua_body_entered(body):
	AguaSound.play()
	hide()
	base.emit_signal("lose")
	

func _physics_process(delta):
	time += delta
	if vivo && time > TIME_PERIOD:
		var velocidade = Vector2(0,10)
		if Input.is_action_pressed("direita"):
			velocidade.x = 500
	
		if Input.is_action_pressed("esquerda"):
			velocidade.x = -500
	
		velocidade.y= 30000 * delta
		set_velocity(velocidade)
		move_and_slide()
		velocidade = velocity
	




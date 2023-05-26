extends Sprite2D

var animator: AnimationPlayer
var area: Area2D
var passing_bis: Sprite2D
var boca_aberta = false

var texture_boca_fechada = load("res://microjogos/2023S1/bis-limao/recursos/gamuto.png")
var texture_boca_aberta = load("res://microjogos/2023S1/bis-limao/recursos/gamuto boca aberta.png")

func _ready():
	animator = get_node("AnimationPlayer")
	area = get_node("Area que engole")
	area.connect("area_entered", bis_entering)
	area.connect("area_exited", bis_leaving)

func _process(delta):
	if Input.is_action_just_pressed("acao"):
		texture = texture_boca_aberta
		boca_aberta = true 
		push_bis()
	elif Input.is_action_just_released("acao"):
		texture = texture_boca_fechada
		boca_aberta = false

func bis_entering(body: Area2D):
	passing_bis = body.get_parent()
	if boca_aberta:
		push_bis()

func bis_leaving(body: Area2D):
	pass

func push_bis():
	if passing_bis == null:
		return
	passing_bis.push()
	passing_bis = null

func loseAnim(reason: String):
	texture = texture_boca_aberta
	animator.play(reason)

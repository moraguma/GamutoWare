extends Node2D

signal win
signal lose

const WIDTH = 240
const HEIGHT = 135
var tempoativo = 1
var vitoria = 1
func _ready():
	var  anEU = get_node("Player/parado1")
	anEU.play()
	var anBA = get_node("Inimigo/parado2")
	anBA.play()
	
	var intro = get_node("TempoIntro")
	intro.start(randf_range(3,5))
	
	"_on_tempo_intro_timeout()
	_on_sprite_timeout()"
func _physics_process(delta):
	if Input.is_action_just_pressed("acao") and tempoativo == 2 and vitoria == 1:
		get_node("Player/parado1").visible = false
		get_node("Player/tiro1").visible = true
		var tiro1 = get_node("Player/tiro1")
		tiro1.play()
		emit_signal("win")
		vitoria = 3
	elif Input.is_action_just_pressed("acao") and vitoria == 2 and tempoativo == 1:
		get_node("Inimigo/parado2").visible = false
		get_node("Inimigo/tiro2").visible = true
		var tiro2 = get_node("Inimigo/tiro2")
		tiro2.play()
		emit_signal("lose")
	
func _on_tempo_intro_timeout():
	get_node("atire").visible = true
	get_node("sino").play()
	
	var sprite = get_node("TempoIntro/sprite")
	sprite.start(0.5)
	tempoativo = 2
func _on_sprite_timeout():
	tempoativo = 2
	get_node("atire").visible = false
	
	var reacao = get_node("TempoIntro/TempoReacao")
	reacao.start(0.3)
			
func _on_tempo_reacao_timeout():
	tempoativo = 1
	vitoria = 2
	






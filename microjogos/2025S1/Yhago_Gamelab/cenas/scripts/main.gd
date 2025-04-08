extends Node2D


signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var winnable = true
var losable = true

@onready var anim_balde: AnimatedSprite2D = $AnimBalde
@onready var anim_vara: AnimatedSprite2D = $AnimVara

var v_posi_inic: Vector2

@onready var max_peixe: Sprite2D = $posimaxpeixe
@onready var peixe: Area2D = $Peixe
@onready var anzol: Area2D = $Anzol

var a_posi_inic: Vector2
var a_posi_now: Vector2
var p_posi_inic: Vector2
var p_posi_now: Vector2
var p_posi_max: Vector2

var speed = 2.5

func _ready():
	anim_balde.play("default")
	anim_vara.play("default")
	
	v_posi_inic = anim_vara.position

	
	a_posi_inic = anzol.position
	a_posi_now = a_posi_inic
	
	p_posi_inic = peixe.position
	p_posi_max = max_peixe.position
	p_posi_now = p_posi_max
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("APERTE ESPAÇO")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("PRESS SPACE")
	
	randomize()

		
func _process(delta: float) -> void:
		
	if Input.is_action_just_pressed("acao") and anzol.position.y > p_posi_inic.y:
		var new_a_posi: Vector2
		new_a_posi.y = anzol.position.y - 128
		a_posi_now = new_a_posi
		
	if !Input.is_action_pressed("acao"):
		a_posi_now.y = lerp(a_posi_now.y, a_posi_inic.y, delta * speed *2)
		
	anzol.position.y = lerp(anzol.position.y, a_posi_now.y, delta * speed *2)
		
	peixe.position.y = lerp(peixe.position.y, p_posi_now.y, delta * speed)

func _on_peixe_timer_timeout() -> void:
	p_posi_now.y = randf_range(p_posi_inic.y, p_posi_max.y)


func _on_peixe_area_entered(area: Area2D) -> void:
	emit_signal("win")
	anim_vara.play("puxando")
	anim_vara.position.y -= 180
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("!")

func _on_peixe_area_exited(area: Area2D) -> void:
	emit_signal("lose")
	anim_vara.play("default")
	anim_vara.position = v_posi_inic
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("X")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("X")
			

extends Node2D


signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var winnable = true
var losable = true

@onready var peixe: Area2D = $Peixe
@onready var anzol: Area2D = $Anzol
var a_posi_inic: Vector2
var a_posi_now: Vector2

var speed = 2.5

func _ready():
	a_posi_inic = anzol.position
	a_posi_now = a_posi_inic
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("UM PEIXE MORDEU A ISCA!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("A FISH!")
	
	randomize()

func register_win():
	if(winnable):
		losable = false
		get_node("VictorySFX").play()
		emit_signal("win")

func register_lose():
	if(losable):
		winnable = false
		losable = false
		get_node("DefeatSFX").play()
		emit_signal("lose")
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cima"):
		queue_free()
	if Input.is_action_just_pressed("baixo"):
		get_tree().change_scene_to_file("res://microjogos/2022S1/Yhago_Gamelab/cenas/main.tscn")
	
	if Input.is_action_just_pressed("acao"):
		var new_a_posi: Vector2
		new_a_posi.y = anzol.position.y - 64
		a_posi_now = new_a_posi
		
	if !Input.is_action_pressed("acao"):
		a_posi_now.y = lerp(a_posi_now.y, a_posi_inic.y, delta * speed)
	#elif anzol.position != a_posi_inic:
	anzol.position.y = lerp(anzol.position.y, a_posi_now.y, delta * speed)
		

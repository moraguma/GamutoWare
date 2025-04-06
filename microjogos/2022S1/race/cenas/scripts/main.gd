extends Node2D


signal win
signal lose

const WIDTH = 1920
const HEIGHT = 1080

var winnable = true
var losable = true

@onready var anzol: Sprite2D = $Sprite2D
var a_posi_inic

func _ready():
	a_posi_inic = anzol.position
	
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("VENCA A CORRIDA!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("WIN THE RACE!")
	
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
	if Input.is_action_just_pressed("baixo"):
		queue_free()
	if Input.is_action_just_pressed("baixo"):
		get_tree().change_scene_to_file("res://microjogos/2022S1/Yhago_Gamelab/cenas/main.tscn")
	
	if Input.is_action_just_pressed("acao"):
		anzol.position.y -= 32
	
	elif anzol.position != a_posi_inic:
		anzol.position.y = lerp(anzol.position.y, a_posi_inic.y, delta)
		

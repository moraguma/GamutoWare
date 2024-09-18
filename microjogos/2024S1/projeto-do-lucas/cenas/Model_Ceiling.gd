extends Area2D

var ceiling = "ceiling"
var is_in_ceiling = false
func _ready():
	add_to_group(ceiling)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("acao") and is_in_ceiling:
		await get_tree().create_timer(0.1).timeout
		$Model_Sprite_Ceiling.texture = load("res://microjogos/2024S1/projeto-do-lucas/recursos/IMG_005_AWAKE.png")
	pass

func _on_player_focus_area_entered(area):
	if area.is_in_group(ceiling):
		$Model_Sprite_Ceiling.texture = load("res://microjogos/2024S1/projeto-do-lucas/recursos/IMG_004_MODEL_FOCUS.png")
		is_in_ceiling = true

func _on_player_focus_area_exited(area):
	$Model_Sprite_Ceiling.texture = load("res://microjogos/2024S1/projeto-do-lucas/recursos/IMG_003_MODEL.png")

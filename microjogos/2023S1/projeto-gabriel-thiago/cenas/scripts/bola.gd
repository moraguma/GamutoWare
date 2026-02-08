extends CharacterBody2D

@onready var mira = $"../mira"
var chegouMira = false;
var comecouMov = false;
var atingiu_alvo = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("acao"):
		comecouMov = true
		$AnimationPlayer.play("chutei")
		
	if comecouMov == true:
		position = lerp(position, mira.position, 0.3)
	
		
func _atingiu_alvo(body: Node2D) -> void:
	atingiu_alvo = true

func _chute_finalizado(anim_name: StringName) -> void:
	if atingiu_alvo:
		$"../NotificationCenter".notify("GOLLLLLLLLLLLLLLLL!")
		get_parent().register_win()
	else:
		match Global.language:
			Global.LANGUAGE.EN:
				$"../NotificationCenter".notify("MISS!")
			Global.LANGUAGE.PT:
				$"../NotificationCenter".notify("ERRROU!")
		get_parent().register_lose()

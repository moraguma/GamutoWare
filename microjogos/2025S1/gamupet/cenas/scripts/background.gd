extends Node2D

var sala = 2
@onready var needs = $"../Needs"

func _ready():
	pass

func _physics_process(delta):
	
	if Input.is_action_just_pressed('esquerda') and int(position.x) % 1920 == 0 and position.x < 1920:
		var tween = create_tween()
		var target_pos = Vector2(position.x + 1920, position.y)
		
		tween.tween_property(self, 'position', target_pos, 0.2).set_ease(Tween.EASE_OUT)
		sala -= 1
	elif Input.is_action_just_pressed('direita') and int(position.x) % 1920 == 0 and position.x > -3840:
		var tween = create_tween()
		var target_pos = Vector2(position.x - 1920, position.y)
		
		tween.tween_property(self, 'position', target_pos, 0.2).set_ease(Tween.EASE_OUT)
		sala += 1
		
	if Input.is_action_just_pressed('acao'):
		if sala == 1:
			if needs.condicoes[0] == 0:
				$Hand/AnimationPlayer.play('pet')
				$Hand/AnimationPlayer.queue('RESET')
				needs.condicao_antiga = 0
				needs.condicoes[0] = 1
				needs.nova_condicao()
			else:
				$"..".register_lose()
		if sala == 2:
			if needs.condicoes[1] == 0:
				$food/AnimationPlayer.play('eat')
				$food/AnimationPlayer.queue('RESET')
				needs.condicao_antiga = 1
				needs.condicoes[1] = 1
				needs.nova_condicao()
			else:
				$"..".register_lose()
		if sala == 3:
			if needs.condicoes[2] == 0:
				$darkness.modulate = Color(1.0, 1.0, 1.0, 0.55)
				needs.condicoes[2] = 1
				$"../gamupet/Sprite2D".frame = 0
				$"..".register_win()
			else:
				$"..".register_lose()
		if sala == 4:
			$shower/AnimationPlayer.play('shower')
			$shower/AnimationPlayer.queue('RESET')
			if needs.condicoes[3] == 0:
				needs.condicao_antiga = 3
				needs.condicoes[3] = 1
				needs.nova_condicao()
			else:
				$"..".register_lose()
		

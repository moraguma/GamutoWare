extends Sprite2D

@export var body_part: String
@export var anim_player:AnimationPlayer
@export var audio_player:AudioStreamPlayer
@export var key_bind: String
@export var index:= 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(key_bind) and not get_parent().fail and not get_parent().won:
		if get_parent().current_index == index:
			get_parent().add_part(body_part)
			anim_player.play("open")
			audio_player.play()
			
		else:
			get_parent().lose()

extends Sprite2D

@export var body_part:String
@export var anim_player:AnimationPlayer
@export var audio_player:AudioStreamPlayer
@export var action: StringName
@export var index := 0
@export var root:Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(action) and not root.fail and not root.won:
		if root.current_index == index:
			root.add_part(body_part)
			anim_player.play("open")
			audio_player.play()
		else:
			root.lose()

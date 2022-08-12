extends Sprite

var t = 0
var active = true

onready var base = get_parent()
onready var gamuturai_animation_player = get_node('../Gamuturai/AnimationPlayer')


func _ready():
	randomize()


func _process(delta):
	t += delta
	if active:
		position.x= (967) + 432 * cos(PI * 8/5 * t)
		
		if Input.is_action_pressed('acao'):
			active = false
			
			if 880 < position.x and position.x< 1038: 
				gamuturai_animation_player.play("win")
				base.emit_signal("win")
				
				print("você é um tremendo batutinha")
			elif 724 <= position.x and position.x <= 880 or 1038 <= position.x and position.x  <= 1210:
				gamuturai_animation_player.play("half")
				base.emit_signal("win")
				
				print("você é quase um batutinha")
			else:
				gamuturai_animation_player.play("lose")
				base.emit_signal("lose")
				
				print("você não é um batutinha")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

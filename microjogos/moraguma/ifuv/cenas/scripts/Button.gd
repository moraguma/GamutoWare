extends Sprite


export (String) var up_path
export (String) var right_path
export (String) var down_path
export (String) var left_path


var up = null
var right = null
var down = null
var left = null


onready var main = get_parent().get_parent()
onready var animation_player = $AnimationPlayer


func _ready():
	up = get_node_or_null(up_path)
	right = get_node_or_null(right_path)
	down = get_node_or_null(down_path)
	left = get_node_or_null(left_path)
	
	frame = 0


func press():
	main.play_key()
	animation_player.play("press")

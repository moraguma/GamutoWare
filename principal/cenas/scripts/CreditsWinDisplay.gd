extends "res://principal/cenas/scripts/Droppable.gd"


const LERP_WEIGHT = 0.1
const INITIAL_POS = Vector2(960, -450)
const ANIMATION_TIME = 1.4


var aim_pos: Vector2


@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	timer.timeout.connect(drop)
	
	aim_pos = INITIAL_POS


func _process(delta: float) -> void:
	super._process(delta)
	
	if not falling:
		position = lerp(position, aim_pos, LERP_WEIGHT)


func win():
	animation_player.play("win")
	setup()


func lose():
	animation_player.play("lose")
	setup()


func setup():
	show()
	rotation = 0
	position = INITIAL_POS
	aim_pos = Vector2(960, 540)
	
	timer.start(ANIMATION_TIME)


func stop_drop():
	hide()

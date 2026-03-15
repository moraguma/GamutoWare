extends Area2D


const CELL_SIZE = 16
const SPRITE_ACCEL = 0.3


var cell_pos = Vector2(0, 0)


@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer


func _ready():
	force_update_cell_pos()
	
	animation_player.play("idle")


func force_update_cell_pos():
	cell_pos = Vector2(int(position[0] / CELL_SIZE), int(position[1] / CELL_SIZE))


func _process(delta):
	sprite.position = sprite.position.lerp(Vector2(0, 0), SPRITE_ACCEL)


func move(dir):
	cell_pos += dir
	
	position += dir * CELL_SIZE
	sprite.position -= dir * CELL_SIZE


func register_win():
	animation_player.play("pop")
	$StabSound.play()
	monitorable = false

extends Node2D


signal win
signal lose


const WIDTH = 384
const HEIGHT = 216


const MAX_PLAYER_MOVEMENT = Vector2(48, 0)
const MAX_GOAL_MOVEMENT_1 = Vector2(0, -32)
const MAX_GOAL_MOVEMENT_2 = Vector2(16, 16)
const MAX_PLAYER_VARIATION = Vector2(-16, 0)


@onready var player = $Player
@onready var hook = $Hook
@onready var goal = $Goal


func _ready():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("ATRAVESSE!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("CROSS!")
	
	$Music.play()
	
	randomize()
	
	var extra_player_movement = randf() * MAX_PLAYER_MOVEMENT
	var extra_goal_movement = randf() * MAX_GOAL_MOVEMENT_1 + randf() * MAX_GOAL_MOVEMENT_2
	
	player.position += extra_player_movement + randf() * MAX_PLAYER_VARIATION
	hook.position += extra_player_movement
	goal.position += extra_goal_movement
	
	player.set_hanger(hook)


func register_win(_body):
	emit_signal("win")
	
func register_lose(_body):
	emit_signal("lose")

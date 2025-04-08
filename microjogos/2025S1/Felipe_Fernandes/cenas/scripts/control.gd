extends Control

@onready var main_game: Timer = $main_game
@onready var end_screen: Timer = $end_screen
@onready var init_time: Timer = $init_time

@onready var label: Label = $Label
@onready var button_controller: Node2D = $"../ButtonController"

@onready var background: AnimatedSprite2D = $"../background"
@onready var progress_bar: TextureProgressBar = $BoxContainer/ProgressBar
@onready var shoot_sound: AudioStreamPlayer2D = $shoot_sound

var win := false
var end_game = false

func _process(delta: float) -> void:
	label.text = "%.2f" % (main_game.time_left)
	
	if (end_game && button_controller.buttons.filter(func n(b): return b.visible ).size() <= 0):
		background.modulate.a = 1
		win = button_controller.points >= progress_bar.target_value
		
		shoot_sound.play(.5)
		var main: Node2D = $main

		if (win):
			background.animation = "win"
			main.register_win()
		else: 
			background.animation = "defeat"
			main.register_lose()

func _on_init_time_timeout() -> void:
	background.animation = "main_game"
	button_controller.can_spawn = true
	background.modulate.a = 0.5
		
	main_game.start()

func _on_main_game_timeout() -> void:
	button_controller.can_spawn = false
	end_game = true

extends Node2D

enum MODE {ENDLESS, JAM}

# ------------------------------------------------------------------------------
# CONSTANTES
# ------------------------------------------------------------------------------
const MENU_PATH = "res://principal/cenas/Menu.tscn"
const WIN_PATH = "res://principal/cenas/Vitoria.tscn"
const LOSE_PATH = "res://principal/cenas/GameOver.tscn"

const BASE_WIDTH = 1920
const BASE_HEIGHT = 1080

const MICROGAME_TIME = 6
# ------------------------------------------------------------------------------
# VARIÁVEIS
# ------------------------------------------------------------------------------
export (Array, String) var microgame_paths
var microgame_queue = []

var total_microgames
var current_microgame
var icon_dict = {}
var microgame_dict = {}

var total_lives = 3
var score = 0

var mode = MODE.ENDLESS

var won = false
# ------------------------------------------------------------------------------
# NÓS
# ------------------------------------------------------------------------------
onready var display = $Display
onready var game = $Display/Game
onready var animation_player = $AnimationPlayer
onready var timer = $Timer

onready var life = $GameUI/Life
onready var game_icons = [$GameUI/GameIcons/Game1, $GameUI/GameIcons/Game2, $GameUI/GameIcons/Game3, $GameUI/GameIcons/Game4]
onready var gamuto = $GameUI/GameIcons/Gamuto
onready var timer_indicator = $TimerIndicator


func isolate_folder(path, tolerance):
	var pos = len(path) - 1
	
	while tolerance > 0:
		if path[pos] == "/":
			tolerance -= 1
		pos -= 1
	
	return path.substr(0, pos + 1)


func load_icons():
	for i in range(len(microgame_paths)):
		if not icon_dict.has(microgame_paths[i]):
			var path = isolate_folder(microgame_paths[i], 2) + "/capa.png"
			icon_dict[microgame_paths[i]] = load(isolate_folder(microgame_paths[i], 2) + "/capa.png")
			icon_dict[microgame_paths[i]].set_flags(Texture.FLAG_FILTER)


func load_microgames():
	for i in range(len(microgame_paths)):
		microgame_dict[microgame_paths[i]] = load(microgame_paths[i])


func display_icons():
	for i in range(4):
		if total_microgames > i:
			game_icons[i].show()
			game_icons[i].texture = icon_dict[microgame_queue[i]]
		else:
			game_icons[i].hide()


func fisher_yates_shuffle(l):
	var n = len(l)
	
	for i in range(n - 1):
		var j = randi() % (n - i) + i
		var aux = l[j]
		l[j] = l[i]
		l[i] = aux
	
	return l


func add_to_queue():
	microgame_queue.append(microgame_paths[randi() % len(microgame_paths)])


func update_microgames():
	microgame_queue.pop_front()
	match mode:
		MODE.ENDLESS:
			add_to_queue()
		MODE.JAM:
			total_microgames -= 1


func setup_jam_mode(microgames):
	mode = MODE.JAM
	microgame_paths = microgames


func setup_arcade_mode(microgames):
	mode = MODE.ENDLESS
	microgame_paths = microgames


func _ready():
	SoundController.play_game()
	
	timer.connect("timeout", self, "finish_game")
	
	load_icons()
	load_microgames()
	
	randomize()
	
	match mode:
		MODE.ENDLESS:
			total_microgames = 4
			for i in range(4):
				add_to_queue()
		MODE.JAM:
			total_microgames = len(microgame_paths)
			microgame_queue = microgame_paths.duplicate()
			fisher_yates_shuffle(microgame_queue)
	
	display_icons()
	life.set_lives(total_lives)
	
	animation_player.play("start")


func _physics_process(delta):
	if Input.is_action_just_pressed("sair"):
		Global.goto_scene(MENU_PATH)


func load_next_game():
	update_microgames()
	display_icons()


func next_game():
	if total_microgames > 0:
		start_game(microgame_queue[0])
	else:
		win_game()


func start_game(path):
	SoundController.mute_game()
	
	current_microgame = microgame_dict[path].instance()
	current_microgame.connect("win", self, "win_microgame")
	current_microgame.connect("lose", self, "lose_microgame")
	
	#display.scale = Vector2(BASE_WIDTH/current_microgame.WIDTH, -BASE_HEIGHT/current_microgame.HEIGHT)
	game.size = Vector2(current_microgame.WIDTH, current_microgame.HEIGHT)
	game.update_worlds()
	
	game.add_child(current_microgame)
	
	won = false
	timer.start(MICROGAME_TIME)


func finish_game():
	SoundController.unmute_game()
	
	timer_indicator.deactivate()
	
	if not (total_lives == 1 and won == false):
		load_next_game()
	
	if won == true:
		score += 1
		if total_microgames <= 0:
			animation_player.play("win_game")
		else:
			animation_player.play("win")
	else: 
		lose_life()
		if total_lives <= 0:
			game_icons[0].hide()
			gamuto.position = Vector2(-600, -120)
			
			timer.stop()
			animation_player.play("game_over")
		else:
			if total_microgames <= 0:
				timer.stop()
				animation_player.play("take_damage_and_win")
			else:
				animation_player.play("lose")


func free_microgame():
	if current_microgame != null:
		current_microgame.queue_free()
		current_microgame = null


func lose_life():
	total_lives -= 1


func update_lives_counter():
	SoundController.play_sfx("damage")
	life.set_lives(total_lives)


func win_microgame():
	won = true


func lose_microgame():
	won = false


func win_game():
	SoundController.play_menu()
	Global.goto_scene(WIN_PATH)


func end_game():
	SoundController.play_menu()
	Global.goto_scene_and_call(LOSE_PATH, "set_score", [score])


func camera_shake():
	GlobalCamera.add_trauma()


func play_throw():
	SoundController.play_sfx("throw")


func play_damage():
	SoundController.play_sfx("damage")


func play_win():
	SoundController.play_sfx("win")


func stop_music():
	SoundController.mute_game()


func give_instructions():
	match Global.language:
		Global.LANGUAGE.PT:
			NotificationCenter.notify("SETAS E ESPACO!")
		Global.LANGUAGE.EN:
			NotificationCenter.notify("ARROWS AND SPACE!")

extends Node2D

enum MODE {ENDLESS, JAM}

# ------------------------------------------------------------------------------
# CONSTANTES
# ------------------------------------------------------------------------------
const MENU_PATH = "res://principal/cenas/Menu.tscn"
const WIN_PATH = "res://principal/cenas/Vitoria.tscn"
const LOSE_PATH = "res://principal/cenas/GameOver.tscn"

const BASE_WIDTH = 1920.0
const BASE_HEIGHT = 1080.0

const MICROGAME_TIME = 6

const MIN_MINIGAME_POOL = 2
# ------------------------------------------------------------------------------
# VARIÁVEIS
# ------------------------------------------------------------------------------
@export var microgame_paths: Array
var microgame_queue = []

var total_microgames
var current_microgame
var icon_dict = {}
var microgame_dict = {}

var total_lives = 3
var score = 0

var difficulty_level = 0
var difficulty_slot = 0

var mode = MODE.ENDLESS

var won = false

@onready var minigame_data = preload("res://principal/recursos/data/Minigames.gd").new().minigame_data
# ------------------------------------------------------------------------------
# NÓS
# ------------------------------------------------------------------------------
@onready var display = $Display
@onready var game = $Display/Game
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

@onready var life = $GameUI/Life
@onready var game_icons = [$GameUI/GameIcons/Game1, $GameUI/GameIcons/Game2, $GameUI/GameIcons/Game3, $GameUI/GameIcons/Game4]
@onready var gamuto = $GameUI/GameIcons/Gamuto
@onready var timer_indicator = $TimerIndicator


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
			var path = minigame_data[microgame_paths[i]]["cover"]
			icon_dict[microgame_paths[i]] = load(path)
			#icon_dict[microgame_paths[i]].set_flags(Texture2D.FLAG_FILTER)


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


func sort_by_difficulty(l):
	# Insertion sort
	for i in range(1, len(l)):
		var key = l[i]
		
		var j = i - 1
		while j >= 0 and minigame_data[key]["difficulty"] < minigame_data[l[j]]["difficulty"]:
			l[j + 1] = l[j]
			j -= 1
		l[j + 1] = key


func add_to_queue():
	if difficulty_slot < len(microgame_paths) - 1:
		# Adds all valid minigames to pool. If not enough minigames are in the pool, can add more
		while true:
			difficulty_level += 1
			while minigame_data[microgame_paths[difficulty_slot]]["difficulty"] < difficulty_level and difficulty_slot < len(microgame_paths) - 1:
				difficulty_slot += 1
			
			if difficulty_slot >= MIN_MINIGAME_POOL + 1 or difficulty_slot == len(microgame_paths) - 1:
				break
	
	if difficulty_slot > 0:
		# Selects a random minigame from pool. Moves the selected minigame to the end of the pool so it
		# can't be selected twice in a row
		var selection = randi() % difficulty_slot
		microgame_queue.append(microgame_paths[selection])
		
		var aux = microgame_paths[difficulty_slot]
		microgame_paths[difficulty_slot] = microgame_paths[selection]
		microgame_paths[selection] = aux
	else:
		# Selects the only minigame
		microgame_queue.append(microgame_paths[0])


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
	
	timer.connect("timeout",Callable(self,"finish_game"))
	
	load_icons()
	load_microgames()
	
	randomize()
	
	match mode:
		MODE.ENDLESS:
			sort_by_difficulty(microgame_paths)
			
			total_microgames = 4
			for i in range(4):
				add_to_queue()
		MODE.JAM:
			total_microgames = len(microgame_paths)
			microgame_queue = microgame_paths.duplicate()
			fisher_yates_shuffle(microgame_queue)
			
			# Pushes minigames to their minimum difficulty level as best as it can
			for i in range(total_microgames - 1, -1, -1):
				if minigame_data[microgame_queue[i]]["difficulty"] > i:
					microgame_queue = microgame_queue.slice(0, i) + \
						microgame_queue.slice(i + 1, minigame_data[microgame_queue[i]]["difficulty"]) + \
						[microgame_queue[i]] + microgame_queue.slice(minigame_data[microgame_queue[i]]["difficulty"])
	
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
	Global.register_minigame(path)
	
	SoundController.mute_game()
	
	current_microgame = microgame_dict[path].instantiate()
	current_microgame.connect("win",Callable(self,"win_microgame"))
	current_microgame.connect("lose",Callable(self,"lose_microgame"))
	
#	display.stretch = false
#	game.size = Vector2(current_microgame.WIDTH, current_microgame.HEIGHT)
#	display.stretch = true
	var convert_ratio=max(BASE_WIDTH/float(current_microgame.WIDTH),BASE_HEIGHT/float(current_microgame.HEIGHT))
	
	display.size = Vector2(current_microgame.WIDTH, current_microgame.HEIGHT)
	display.scale=Vector2(convert_ratio,convert_ratio)
	display.texture_filter = current_microgame.texture_filter
	
	won = false
	
	game.add_child(current_microgame)
	
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

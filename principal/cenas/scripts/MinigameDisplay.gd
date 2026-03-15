extends Node2D


signal done


const BASE_WIDTH = 1920
const BASE_HEIGHT = 1080

const MICROGAME_TIME = 6

const MAX_MASK_SCALE = Vector2(8.6, 8.6)
const TRANSITION_TIME = 0.25


var current_microgame = null
var won = false
var t: Tween


@onready var display: SubViewportContainer = $Display
@onready var game: SubViewport = $Display/Game
@onready var mask: Sprite2D = $MicrogameMaskViewport/MicrogameMask

@onready var timer_indicator = $TimerIndicator
@onready var timer: Timer = $Timer
@onready var free_timer: Timer = $FreeTimer


func _ready() -> void:
	timer.connect("timeout", free_microgame)
	free_timer.connect("timeout", instant_free_microgame)
	Minigames._win.connect(win_microgame)
	Minigames._lose.connect(lose_microgame)


func set_mask_center(pos):
	mask.position = pos


func start_game(microgame):
	if not free_timer.is_stopped():
		instant_free_microgame()
	
	Global.register_minigame(microgame.resource_path)
	
	SoundController.mute_game()
	if ResourceLoader.load_threaded_get_status(microgame.main_scene.resource_path) == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_INVALID_RESOURCE:
		print("Loading without previous request: "+microgame.main_scene.resource_path)
		ResourceLoader.load_threaded_request(microgame.main_scene.resource_path)
	current_microgame = ResourceLoader.load_threaded_get(microgame.main_scene.resource_path).instantiate()
	
	var convert_ratio = max(BASE_WIDTH/float(current_microgame.WIDTH),BASE_HEIGHT/float(current_microgame.HEIGHT))
	
	display.size = Vector2(current_microgame.WIDTH, current_microgame.HEIGHT)
	display.scale=Vector2(convert_ratio,convert_ratio)
	display.texture_filter = current_microgame.texture_filter
	
	won = false
	
	game.add_child(current_microgame)
	
	match Global.language:
		Global.LANGUAGE.EN:
			NotificationCenter.notify(microgame.start_message_en)
		Global.LANGUAGE.PT:
			NotificationCenter.notify(microgame.start_message_pt)
	
	timer.start(MICROGAME_TIME)
	
	reset_tween()
	mask.scale = Vector2(0.0, 0.0)
	t.set_ease(Tween.EASE_IN)
	t.tween_property(mask, "scale", MAX_MASK_SCALE, TRANSITION_TIME)
	timer_indicator.activate()


func free_microgame():
	if not timer.is_stopped():
		timer.stop()
	
	reset_tween()
	mask.scale = MAX_MASK_SCALE
	t.set_ease(Tween.EASE_OUT)
	t.tween_property(mask, "scale", Vector2(0, 0), TRANSITION_TIME)
	timer_indicator.deactivate()
	
	done.emit()
	
	free_timer.start(TRANSITION_TIME)


func instant_free_microgame():
	if not free_timer.is_stopped():
		free_timer.stop()
	
	if current_microgame != null:
		current_microgame.queue_free()
		current_microgame = null


func reset_tween():
	if t != null:
		t.kill()
	t = create_tween()
	t.set_trans(Tween.TRANS_CIRC)


func win_microgame(source: Node) -> void:
	# Microgame cannot register win if source of win call is not a descendant of the current microgames main node
	if source != current_microgame and not source.is_ancestor_of(current_microgame):
		return
	won = true


func lose_microgame(source: Node):
	# Microgame cannot register lose if source of win call is not a descendant of the current microgames main node
	if source != current_microgame and not source.is_ancestor_of(current_microgame):
		return
	won = false

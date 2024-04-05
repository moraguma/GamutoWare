extends Node

enum LANGUAGE {PT, EN}

const SaveFile = preload("res://principal/cenas/scripts/SaveFile.gd")
const SAVE_PATH = "res://principal/saves/"
const SAVE_NAME = "save.tres"
const SAVE_VARS = ["played_minigames", "minigame_settings", "filter_settings", "current_version", 'highscore', "misc"]


var save


var current_scene = null
var current_path = ""
var transitioning = false
var call_queued = false

var queued_method
var queued_parameters

var language

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	current_path = current_scene.scene_file_path
	
	
	load_game()

func goto_scene_and_call(path, method_name, parameters):
	call_queued = true
	queued_method = method_name
	queued_parameters = parameters
	
	goto_scene(path)


func goto_scene(path):
	if not transitioning:
		current_path = path
		
		transitioning = true
		GlobalCamera.animate_transition()
		await GlobalCamera.transition_time
		call_deferred("deferred_goto_scene")


func deferred_goto_scene():
	transitioning = false
	
	current_scene.free()
	
	var s = ResourceLoader.load(current_path)
	current_scene = s.instantiate()
	
	if call_queued:
		current_scene.callv(queued_method, queued_parameters)
		call_queued = false
	
	get_tree().get_root().add_child(current_scene)
	
	get_tree().set_current_scene(current_scene)


func restart():
	goto_scene(current_path)


# --------------------------------------------------------------------------------------------------
# SAVE
# --------------------------------------------------------------------------------------------------


func validate_save(save):
	for v in SAVE_VARS:
		if save.get(v) == null:
			return false
	
	#if save.current_version < 0.3:
	#	save.current_version = 0.3
	#and so on and so forth
	
	return true


func save_game():
	if not DirAccess.dir_exists_absolute(SAVE_PATH):
		DirAccess.make_dir_recursive_absolute(SAVE_PATH)
	
	ResourceSaver.save(save, SAVE_PATH + SAVE_NAME)


func load_game():
	if not FileAccess.file_exists(SAVE_PATH + SAVE_NAME):
		save = SaveFile.new()
		save_game()
	
	save = load(SAVE_PATH + SAVE_NAME)
	
	if not validate_save(save):
		return false
	return true


func get_modifier_settings():
	return save.modifier_settings


func get_minigame_settings():
	return save.minigame_settings


func get_filter_settings():
	return save.filter_settings


func get_language():
	if save.language == -1:
		match OS.get_locale_language():
			"pt":
				set_language(Global.LANGUAGE.PT)
			"en":
				set_language(Global.LANGUAGE.EN)
	return save.language


func set_modifier_settings(modifier_settings):
	save.modifier_settings = modifier_settings


func set_minigame_settings(minigame_settings):
	save.minigame_settings = minigame_settings


func set_filter_settings(filter_settings):
	save.filter_settings = filter_settings


func set_language(language):
	save.language = language
	save_game()


func register_minigame(path):
	save.played_minigames[path] = true
	save_game()


func check_minigame(path):
	if path in save.played_minigames:
		return save.played_minigames[path]
	return false


func get_highscore():
	return save.highscore


func set_highscore(highscore):
	save.highscore = highscore
	save_game()

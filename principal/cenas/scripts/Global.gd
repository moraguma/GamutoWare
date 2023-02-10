extends Node


enum LANGUAGE {PT, EN}


const SaveFile = preload("res://principal/cenas/scripts/SaveFile.gd")
const SAVE_PATH = "res://principal/saves/"
const SAVE_NAME = "save.tres"
const SAVE_VARS = ["played_minigames", "minigame_settings", "filter_settings", "current_version", 'highscore', "misc"]


var save


var language = LANGUAGE.PT


var current_scene = null
var current_path = ""
var transitioning = false
var call_queued = false

var queued_method
var queued_parameters


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	current_path = current_scene.filename
	
	
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
		yield(GlobalCamera, "transition_time")
		call_deferred("deferred_goto_scene")


func deferred_goto_scene():
	transitioning = false
	
	current_scene.free()
	
	var s = ResourceLoader.load(current_path)
	current_scene = s.instance()
	
	if call_queued:
		current_scene.callv(queued_method, queued_parameters)
		call_queued = false
	
	get_tree().get_root().add_child(current_scene)
	
	get_tree().set_current_scene(current_scene)


func restart():
	goto_scene(current_path)


func update_translation(code):
	language = code


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
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_PATH):
		dir.make_dir_recursive(SAVE_PATH)
	
	ResourceSaver.save(SAVE_PATH + SAVE_NAME, save)


func load_game():
	var dir = Directory.new()
	if not dir.file_exists(SAVE_PATH + SAVE_NAME):
		save = SaveFile.new()
		save_game()
		
	save = load(SAVE_PATH + SAVE_NAME)
	
	if not validate_save(save):
		return false
	return true


func get_minigame_settings():
	return save.minigame_settings


func get_filter_settings():
	return save.filter_settings


func set_minigame_settings(minigame_settings):
	save.minigame_settings = minigame_settings


func set_filter_settings(filter_settings):
	save.filter_settings = filter_settings


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

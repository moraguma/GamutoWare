extends Node


enum LANGUAGE {PT, EN}


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

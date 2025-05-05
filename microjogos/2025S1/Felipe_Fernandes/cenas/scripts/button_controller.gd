extends Node2D

@onready var buttons: Array = $Buttons.get_children()
@onready var spawn_coll: CollisionShape2D = $SpawnArea/SpawnColl
@onready var background_cat: AnimatedSprite2D = $"../Backgrounds/background_cat"

@export var max_buttons := 3
@export var time_range := [.25, .5]
@export var camera : Camera2D
@export var progress_bar : TextureProgressBar

var camera_border := 100.0

var timer := 0.0
var target_timer := randf_range(time_range[0], time_range[1])
var curr_buttons := 0

var possible_buttons := []

var points = 25
var max_points = 100
var point_per_button = 15
var point_per_second = 3

var can_spawn = true

func _ready() -> void:
	var camera_size := get_viewport_rect().size
	camera_size.x /= camera.zoom.x
	camera_size.y /= camera.zoom.y
	
	camera_border = camera_size.x/2
	
	var shape = RectangleShape2D.new()
	shape.size = Vector2(camera_size.x - camera_border, camera_size.y - camera_border)
	
	spawn_coll.set_shape(shape)
	
	for i in buttons:
		i.success_signal.connect(_on_button_success)
		i.fail_signal.connect(_on_button_fail)

func _process(delta: float) -> void:
	var closest = get_closest_button()
	
	#if (Input.is_action_just_pressed("acao")):
		#get_tree().reload_current_scene()
	
	if (closest != null):
		if (Input.is_action_just_pressed("cima") && closest.key != "cima"):
			closest.fail_button()
		if (Input.is_action_just_pressed("baixo") && closest.key != "baixo"):
			closest.fail_button()
		if (Input.is_action_just_pressed("esquerda") && closest.key != "esquerda"):
			closest.fail_button()
		if (Input.is_action_just_pressed("direita") && closest.key != "direita"):
			closest.fail_button()
	
	if (can_spawn):
		points -= point_per_second * delta
		
		if (curr_buttons < max_buttons):
			possible_buttons = buttons.filter(func n(b): return !b.visible )
			
			if (possible_buttons.size() > 0 && buttons.size() - max_buttons < possible_buttons.size()):
				if (timer >= target_timer):
					var button = possible_buttons[ randi_range(0, possible_buttons.size()-1) ]
					button.position = get_random_spawn_point()
					button.reset_button()
					timer = 0
				else:
					timer += delta
	
	
	points = clamp(points, 0, max_points)
	progress_bar.value = points

func get_closest_button():
	var possibles = buttons.filter(func n(b): return b.visible && b.mooving )
	if (possibles.size() <= 0):
		return null
	
	var closest = possibles[0]
	
	for i in buttons:
		if (i.mooving && i.visible && i.radius.scale < closest.radius.scale):
			closest = i
	
	return closest

func get_random_spawn_point():
	var close = true
	var pos = global_position
	
	while (close):
		var rect : Rect2 = spawn_coll.shape.get_rect()
		var x = randi_range(rect.position.x, rect.position.x+rect.size.x)
		var y = randi_range(rect.position.y, rect.position.y+rect.size.y)
		
		pos = global_position + Vector2(x,y)
		var visible_buttons = buttons.filter(func n(b): return b.visible)
		
		if (visible_buttons.size() == 0):
			break
		
		for i in visible_buttons:
			close = pos.distance_to(i.global_position) <= 50
			
			if (close):
				break
	
	return pos

func _on_button_fail() -> void:
	points -= point_per_button*.75

func _on_button_success() -> void:
	points += point_per_button

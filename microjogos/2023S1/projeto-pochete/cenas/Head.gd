extends Area2D

var tile_size = 120
var recently_touched = 0
var tail_nodes = []
@onready var ray = $RayCast2D
@onready var area_ray = get_node("AreaRayCast2D")
@onready var snake = get_node("../../Snake")
@onready var main = get_node("../../../Main")
@export var tail_scene: PackedScene

var inputs = {
	'direita': Vector2.RIGHT,
	'baixo': Vector2.DOWN,
	'esquerda': Vector2.LEFT,
	'cima': Vector2.UP,
}

var rotations = {
	'direita': 0,
	'baixo': PI / 2,
	'esquerda': PI,
	'cima': 1.5 * PI,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	# position += Vector2.ONE * tile_size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_move(pos, dir, delta):
	var target_pos = dir * delta
	var player_pos = pos + target_pos
	ray.target_position = target_pos
	area_ray.target_position = target_pos
	ray.force_raycast_update()
	area_ray.force_raycast_update()
	return (!ray.is_colliding()
			and player_pos.x >= 0 and player_pos.y <= 0
			and player_pos.x <= 120*6 and player_pos.y >= -120*8)

func get_head_rotation(position):
	var d = null
	if tail_nodes:
		var diff = position - tail_nodes[-1].position
		if diff.x > 0:
			d = 'direita'
		if diff.x < 0:
			d = 'esquerda'
		if diff.y > 0:
			d = 'baixo'
		if diff.y < 0:
			d = 'cima'
	if d:
		return rotations[d]
	return get_node('Sprite2D').rotation

func move():
	if main.won:
		return
	var directions = ['direita', 'baixo', 'esquerda', 'cima']
	var tail = null
	for d in directions:
		if Input.is_action_just_pressed(d):
			if check_move(position, inputs[d], tile_size):
				var new_tail = true
				var rotate = true
				if tail_nodes:
					var pos = tail_nodes.find(area_ray.get_collider())
					if pos == len(tail_nodes) - 1:
						var aux = tail_nodes.pop_back()
						aux.queue_free()
						get_node('Sprite2D').rotation = get_head_rotation(position + inputs[d] * tile_size)
						new_tail = false
						rotate = false
					elif pos > -1:
						break
				if new_tail:
					tail = tail_scene.instantiate()
					tail.position = position
				if rotate:
					get_node('Sprite2D').rotation = rotations[d]
				position += inputs[d] * tile_size
				if tail:
					tail_nodes.append(tail)
					snake.add_child(tail)
			break
	

func _physics_process(delta):
	move()

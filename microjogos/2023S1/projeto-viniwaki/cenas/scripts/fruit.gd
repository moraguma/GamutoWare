extends RigidBody2D

var dir_prop = {
	1: 0,
	2: PI / 2,
	3: PI,
	4: 3 * PI / 2,
}
var dir: int = 1
var cut: bool = false

var slice_queue = null


func _init(d = 1):
	dir = d

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = 450 - randf() * 900
	var y = 1700 + randf() * 500
	
	var fruit_types = $whole_sprite.sprite_frames.get_animation_names()
	$whole_sprite.animation = fruit_types[randi() % (fruit_types.size() - 1)]
	
	set_axis_velocity(Vector2(x, -y))
	angular_velocity = 3 - randf() * 6
	
func set_cut():
	$arrow.visible = false
	$whole_sprite.frame = 1
	$collision_shape.disabled = true
	
	cut = true

func set_dir(d):
	dir = d
	$arrow.set_correct_rotation(dir_prop[d])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	if cut == false:
		get_parent().remove_from_slice_queue(dir, self)
	queue_free()

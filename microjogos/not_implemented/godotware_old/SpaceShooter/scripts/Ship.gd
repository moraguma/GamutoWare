# this script implements ship's behaviour

extends Area2D

# stores the necessary scenes
const scn_laser = preload('res://minigames/SpaceShooter/scenes/Laser_Ship.tscn')
const scn_explosion = preload('res://minigames/SpaceShooter/scenes/Explosion.tscn')
const scn_flash = preload('res://minigames/SpaceShooter/scenes/Flash.tscn')

# declare movement variables.
var ACC = 2 # value to increase speed every frame if ship is in movement
var speed = Vector2() # amount to increase/decrease from position every frame

# export ship's armor (life)
export var armor = 1 setget set_armor

# first function called (just one time)
func _ready():
	add_to_group('Ship') # add to Ship group
	shoot() # allows player to start shooting

# called every frame
func _process(delta):
	# makes the ship face the cursor
	look_at(get_global_mouse_pos())
	
	# increase/decrease speed by acceleration depending on the keys pressed
	if Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up"):
		speed.y -= ACC * delta
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		speed.x += ACC * delta
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down"):
		speed.y += ACC * delta
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		speed.x -= ACC * delta

	# if the ship is out of screen, kill it!
	if get_pos().y-16 >= global.view_size.height or \
		get_pos().y+16 <= 0 or \
		get_pos().x-16 >= global.view_size.width or \
		get_pos().x+16 <= 0:
			set_armor(0)

	# apply movement
	translate(speed)

# allows player to shoot
func shoot():
	while true: # infinite loop
		# get both cannons position
		var pos_left = get_node('Cannons/Cannon_Left').get_global_pos()
		var pos_right = get_node('Cannons/Cannon_Right').get_global_pos()
		
		# if is pressing left button mouse, shoots from left cannon.
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			create_laser(pos_left)
		# if is pressing right button mouse, shoots from right cannon.
		if Input.is_mouse_button_pressed(BUTTON_RIGHT):
	    	create_laser(pos_right)
		
		# wait shoot delay time in seconds
		yield(global.create_timer(0.33), 'timeout')
	
# creates laser
func create_laser(pos):
	var laser = scn_laser.instance() # instanciate scn_laser
	laser.set_pos(pos) # set laser's position to given parameter
	
	# get ship and mouse global positions
	var ship_pos = get_global_pos()
	var mouse_pos = get_global_mouse_pos()
	
	# create a new vector from the mouse_pos and ship_pos difference
	var direction = Vector2(mouse_pos.x-ship_pos.x, mouse_pos.y - ship_pos.y)

	# apply normalized direction to laser speed, defining it's direction
	laser.speed = laser.speed * direction.normalized()
	
	laser.look_at(get_global_mouse_pos()) # make laser face the mouse
	
	global.main_node.add_child(laser) # add to main_node
	
# updates armor value when it's damaged
func set_armor(new_value):
	if new_value < armor: # if ship got damaged...
		global.main_node.get_node('Audio_Player').play('hit_ship') # play hit_ship sound
		global.main_node.add_child(scn_flash.instance()) # flash the view
	
	armor = new_value # armor is set to the given parameter
	
	if armor <= 0: # if it's armor (life) is 0 or less...
		create_explosion() # create explosion
		queue_free() # delete the ship node

# creates explosion effect
func create_explosion():
	var explosion = scn_explosion.instance() # instanciate scn_explosion
	explosion.set_pos(get_pos()) # set the effect position to enemy's position
	global.main_node.add_child(explosion) # add it to main node

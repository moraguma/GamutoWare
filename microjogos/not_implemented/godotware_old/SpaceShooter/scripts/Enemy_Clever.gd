# this script implements Clever Enemy behaviour

# extends Enemy script
extends 'res://minigames/SpaceShooter/scripts/Enemy.gd'

# store enemy's laser scene
const scn_laser = preload('res://minigames/SpaceShooter/scenes/Laser_Enemy.tscn')

const SHOOTING_DELAY = 2.5 # set shooting period

# first function called (just one time)
func _ready():
	set_process(true) # enable _process
	
	yield(global.create_timer(1), 'timeout') # wait 1s until start shooting
	shoot() # calls shoot()

# called every frame
func _process(delta):
	# make it bounce when touches the edges
	if get_pos().x <= 16:
		speed.x = abs(speed.x)
	if get_pos().x >= global.view_size.width-16:
		speed.x = -abs(speed.x)
	if get_pos().y <= 16:
		speed.y = abs(speed.y)
	if get_pos().y >= global.view_size.height-16:
		speed.y = -abs(speed.y)

# keeps shooting until it get's destroyed
func shoot():
	while true: # infinite loop
		var laser = scn_laser.instance() # instanciate enemy's laser
		laser.set_pos(get_node('Cannon').get_global_pos()) # set laser position to enemy's Cannon node
		global.main_node.add_child(laser) # add its laser to main node
		
		# set laser direction and rotation depending on the clever movement
		if abs(speed.x) < abs(speed.y):
			if speed.x < 0:
				laser.speed.x = -abs(laser.speed.x)
				laser.set_rotd(270)
			elif speed.x > 0:
				laser.speed.x = abs(laser.speed.x)
				laser.set_rotd(90)
			laser.speed.y = 0
			
		elif abs(speed.x) > abs(speed.y):
			if speed.y < 0:
				laser.speed.y = -abs(laser.speed.y)
				laser.set_rotd(180)
			elif speed.y > 0:
				laser.speed.y = abs(laser.speed.y)
				laser.set_rotd(0)
			laser.speed.x = 0
		
		yield(global.create_timer(SHOOTING_DELAY), 'timeout') # shooting delay
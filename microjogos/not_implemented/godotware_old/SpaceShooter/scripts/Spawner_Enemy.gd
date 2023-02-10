# this script implements the enemy spawner behaviour

extends Node

# stores the enemy types
const kamikaze = preload('res://minigames/SpaceShooter/scenes/Enemy_Kamikaze.tscn')
const clever = preload('res://minigames/SpaceShooter/scenes/Enemy_Clever.tscn')

# enemies attributes (save your time!)
const KAMIKAZE_SPEED = 150
const CLEVER_SLOW_SPEED = 5
const CLEVER_FAST_SPEED = 50
const SPAWN_TIME = 1.5

# spawn random enemies at a random positions
func spawn():
	while true: # infinite loop
		randomize() # apply randomness
		
		var ranPos = randi()%4+0 # choose random int (0:3)
		var ranEnemy = randi()%4+0 # choose random int (0:3)
		
		if ranPos == 0: # spawn from top
			if ranEnemy == 0 or ranEnemy == 1 or ranEnemy == 2: # spawn kamikaze
				var enemy = kamikaze.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.x = rand_range(16, global.view_size.width-16)
				pos.y = -16
				
				# set speed, position and rotation
				enemy.speed = Vector2(0, KAMIKAZE_SPEED)
				enemy.set_pos(pos)
				enemy.set_rotd(0)
				
				# add to main node
				global.main_node.add_child(enemy)
				
			elif ranEnemy == 3: # spawn clever
				var enemy = clever.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.x = rand_range(16, global.view_size.width-16)
				pos.y = -16
				
				# set speed, position and rotation
				enemy.speed = Vector2(global.choose([CLEVER_FAST_SPEED, -CLEVER_FAST_SPEED]), CLEVER_SLOW_SPEED)
				enemy.set_pos(pos)
				enemy.set_rotd(0)
				
				# add to main node
				global.main_node.add_child(enemy)
				
		elif ranPos == 1: # spawn from right
			if ranEnemy == 0 or ranEnemy == 1 or ranEnemy == 2: # spawn kamikaze
				var enemy = kamikaze.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.y = rand_range(16, global.view_size.height-16)
				pos.x = global.view_size.width+16
				
				# set speed, position and rotation
				enemy.speed = Vector2(-KAMIKAZE_SPEED, 0)
				enemy.set_pos(pos)
				enemy.set_rotd(270)
				
				# add to main node
				global.main_node.add_child(enemy)
				
			elif ranEnemy == 3: # spawn clever
				var enemy = clever.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.y = rand_range(16, global.view_size.height-16)
				pos.x = global.view_size.width+16
				
				# set speed, position and rotation
				enemy.speed = Vector2(-CLEVER_SLOW_SPEED, global.choose([CLEVER_FAST_SPEED, -CLEVER_FAST_SPEED]))
				enemy.set_pos(pos)
				enemy.set_rotd(270)
				
				# add to main node
				global.main_node.add_child(enemy)
				
		elif ranPos == 2: # spawn from bottom
			if ranEnemy == 0 or ranEnemy == 1 or ranEnemy == 2: # spawn kamikaze
				var enemy = kamikaze.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.x = rand_range(16, global.view_size.width-16)
				pos.y = global.view_size.height+16
				
				# set speed, position and rotation
				enemy.speed = Vector2(0, -KAMIKAZE_SPEED)
				enemy.set_pos(pos)
				enemy.set_rotd(180)
				
				# add to main node
				global.main_node.add_child(enemy)
				
			elif ranEnemy == 3: # spawn clever
				var enemy = clever.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.x = rand_range(16, global.view_size.width-16)
				pos.y = global.view_size.height+16
				
				# set speed, position and rotation
				enemy.speed = Vector2(global.choose([CLEVER_FAST_SPEED, -CLEVER_FAST_SPEED]), -CLEVER_SLOW_SPEED)
				enemy.set_pos(pos)
				enemy.set_rotd(180)
				
				# add to main node
				global.main_node.add_child(enemy)
				
		elif ranPos == 3: #spawn from left
			if ranEnemy == 0 or ranEnemy == 1 or ranEnemy == 2: # spawn kamikaze
				var enemy = kamikaze.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.y = rand_range(16, global.view_size.height-16)
				pos.x = -16
				
				# set speed, position and rotation
				enemy.speed = Vector2(KAMIKAZE_SPEED, 0)
				enemy.set_pos(pos)
				enemy.set_rotd(90)
				
				# add to main node
				global.main_node.add_child(enemy)
				
			elif ranEnemy == 3: # spawn clever
				var enemy = clever.instance() # instanciate enemy
				var pos = Vector2() # declare position
				
				# calculate random position
				pos.y = rand_range(16, global.view_size.height-16)
				pos.x = -16
				
				# set speed, position and rotation
				enemy.speed = Vector2(CLEVER_SLOW_SPEED, global.choose([CLEVER_FAST_SPEED, -CLEVER_FAST_SPEED]))
				enemy.set_pos(pos)
				enemy.set_rotd(90)
				
				# add to main node
				global.main_node.add_child(enemy)
			
		# wait time until next enemy spawn
		yield(global.create_timer(SPAWN_TIME), 'timeout')
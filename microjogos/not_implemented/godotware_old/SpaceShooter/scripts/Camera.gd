# this script allows camera shaking

extends Camera2D

var magnitude = 0 # shaking intensity
var timeleft = 0 # at shake(), it'll be the shaking time
var is_shaking = false # stores if is currently shaking or not

# this functions shakes the camera
func shake(new_magnitude, lifetime):
	# if lower shaking occurs, do not override
	if magnitude > new_magnitude: return
	
	# set new_magnitude to magnitude and timeleft to lifetime
	magnitude = new_magnitude
	timeleft = lifetime
	
	# if it's already shaking, exit
	if is_shaking: return
	# if not, set is_shaking to true
	is_shaking = true
	
	# repeat for lifetime duration
	while timeleft > 0:
		# set position to a random value within the magnitude
		var pos = Vector2()
		pos.x = rand_range(-magnitude, magnitude)
		pos.y = rand_range(-magnitude, magnitude)
		set_pos(pos)
		
		# decrease timeleft
		timeleft -= get_process_delta_time()
		
		# wait to the next frame
		yield(get_tree(), 'idle_frame')
	
	# reset magnitude to 0
	magnitude = 0
	
	#the camera is not shaking anymore
	is_shaking = false
	
	# set camera to it's original position
	set_pos(Vector2(0,0))
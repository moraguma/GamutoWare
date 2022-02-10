extends AnimationPlayer


const CANT_TRANSITION_DICT = {"jump": ["jump"], "void_jump": ["void_jump"], "land": ["walk"], "void_land": ["void_walk"]}


func play_anim(name):
	if CANT_TRANSITION_DICT.has(current_animation):
		if name in CANT_TRANSITION_DICT[current_animation] or CANT_TRANSITION_DICT[current_animation] == []:
			return
	
	play(name)

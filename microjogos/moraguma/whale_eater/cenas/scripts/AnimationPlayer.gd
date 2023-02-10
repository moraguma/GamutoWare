extends AnimationPlayer


const CANT_TRANSITION_DICT = {"land": ["walk", "idle"]}


func play_anim(anim_name):
	if CANT_TRANSITION_DICT.has(current_animation):
		if CANT_TRANSITION_DICT[current_animation].has(anim_name):
			return
	
	play(anim_name)

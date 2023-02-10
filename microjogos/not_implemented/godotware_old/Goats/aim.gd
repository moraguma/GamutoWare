extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
       set_pos(ev.pos)
	
	for body in get_overlapping_bodies ( ) :
		#print(str('Body entered: ', body.get_groups()))
		if body.is_in_group("Goats"):
			if ev.type == InputEvent.MOUSE_BUTTON:
				body.die()


	pass

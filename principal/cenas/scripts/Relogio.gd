extends Label


func _process(delta):
	var time = Time.get_datetime_dict_from_system()
	
	text = "%02d:%02d" % [time["hour"], time["minute"]]

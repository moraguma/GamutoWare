extends CheckBox


var minigames = []


func load_minigames(new_title, new_minigames):
	text = " " + new_title + " "
	minigames = new_minigames


func get_minigames():
	return minigames

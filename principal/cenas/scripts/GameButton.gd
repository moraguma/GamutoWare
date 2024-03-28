extends "res://principal/cenas/scripts/PressableButton.gd"


const GAME_PATH = "res://principal/cenas/Jogo.tscn"

const MinigameButton = preload("res://principal/cenas/MinigameButton.tscn")


@onready var minigame_data = load("res://principal/recursos/data/Minigames.gd").new()

@onready var minigame_button_container = $"../Clipper/Checkboxes/MinigameButtons/VBoxContainer"
@onready var filter_button_container = $"../Clipper/Checkboxes/FilterButtons/VBoxContainer"
@onready var menu_button = $"../Menu"

var minigame_buttons
var filter_buttons


func _ready():
	var settings = [Global.get_minigame_settings(), Global.get_filter_settings()]
	var data_dicts = [minigame_data.minigame_packs, minigame_data.filters]
	var parents = [minigame_button_container, filter_button_container]
	
	for i in range(len(data_dicts)):
		if len(settings[i]) != len(data_dicts[i]):
			settings[i] = []
			for j in range(len(data_dicts[i])):
				settings[i].append(false)
		
		var last_button = null
		
		var pos = 0
		for title in data_dicts[i]:
			var new_button = MinigameButton.instantiate()
			new_button.load_minigames(title, data_dicts[i][title])
			new_button.button_pressed = settings[i][pos]
			parents[i].add_child(new_button)
			
			if last_button != null:
				last_button.focus_neighbor_bottom = last_button.get_path_to(new_button)
				new_button.focus_neighbor_top = new_button.get_path_to(last_button)
			
			last_button = new_button
			pos += 1
		
		last_button.focus_neighbor_bottom = last_button.get_path_to(menu_button)
	
	minigame_buttons = minigame_button_container.get_children()
	filter_buttons = filter_button_container.get_children()
	
	for minigame_button in minigame_buttons:
		minigame_button.focus_neighbor_right = minigame_button.get_path_to(filter_buttons[0])
	for filter_button in filter_buttons:
		filter_button.focus_neighbor_left = filter_button.get_path_to(minigame_buttons[0])
		filter_button.focus_neighbor_right = filter_button.get_path_to(self)
	menu_button.focus_neighbor_top = menu_button.get_path_to(minigame_buttons[-1])
	focus_neighbor_left = get_path_to(filter_buttons[0])
	
	minigame_buttons[0].grab_focus()


func _pressed():
	var microgame_paths = []
	
	var minigame_settings = []
	for minigame_button in minigame_buttons:
		minigame_settings.append(minigame_button.button_pressed)
		
		if minigame_button.button_pressed:
			microgame_paths.append_array(minigame_button.get_minigames())
	Global.set_minigame_settings(minigame_settings)
	
	var filter_settings = []
	for filter_button in filter_buttons:
		filter_settings.append(filter_button.button_pressed)
		if filter_button.button_pressed:
			for minigame in filter_button.get_minigames():
				microgame_paths.erase(minigame)
	Global.set_filter_settings(filter_settings)
	
	if len(microgame_paths) > 0:
		call_transition(microgame_paths)
	else:
		match Global.language:
			Global.LANGUAGE.PT:
				NotificationCenter.notify("Nenhum minigame selecionado!")
			Global.LANGUAGE.EN:
				NotificationCenter.notify("No minigames selected!")


func call_transition(microgame_paths):
	pass

extends "res://principal/cenas/scripts/ToTitle.gd"

const GAME_PATH = "res://principal/cenas/Jogo.tscn"
const MinigameButton = preload("res://principal/cenas/MinigameButton.tscn")

@onready var minigame_data = preload("res://principal/recursos/data/Minigames.gd").new()

@onready var modifier_button_container = $Checkboxes/Modifier/Control/ModifierButtons/VBoxContainer
@onready var minigame_button_container = $Checkboxes/Minigames/Control/MinigamesButtons/VBoxContainer
@onready var filter_button_container = $Checkboxes/Filters/Control/FilterButtons/VBoxContainer

@onready var menu_button = $Menu
@onready var play_button = $Play

var minigame_buttons
var filter_buttons
var infinite_button # TODO: Infinite mode is pretty hard coded! If more complicated logic for modifiers is implemented this will have to change


func _ready():
	var settings = [Global.get_modifier_settings(), Global.get_minigame_settings(), Global.get_filter_settings()]
	
	# Infinite button - pretty hardcoded
	if len(settings[0]) != 1:
		settings[0] = [false]
	
	infinite_button = MinigameButton.instantiate()
	infinite_button.load_minigames(TranslationManager.get_translation("infinite"), [])
	infinite_button.button_pressed = settings[0][0]
	modifier_button_container.add_child(infinite_button)
	
	# Minigame pack and filter buttons
	var data_dicts = [{}, minigame_data.minigame_packs, minigame_data.filters]
	var parents = [null, minigame_button_container, filter_button_container]
	for i in range(1, len(data_dicts)):
		if len(settings[i]) != len(data_dicts[i]): # Fixes settings if not yet configured
			settings[i] = []
			for j in range(len(data_dicts[i])):
				settings[i].append(false)
		
		var last_button = null
		var pos = 0
		for title in data_dicts[i]: # Create buttons and set intralist neighborhoods
			var new_button = MinigameButton.instantiate()
			new_button.load_minigames(TranslationManager.get_translation(title), data_dicts[i][title])
			new_button.button_pressed = settings[i][pos]
			parents[i].add_child(new_button)
			
			if last_button != null:
				last_button.focus_neighbor_bottom = last_button.get_path_to(new_button)
				new_button.focus_neighbor_top = new_button.get_path_to(last_button)
			
			last_button = new_button
			pos += 1
	
	minigame_buttons = minigame_button_container.get_children()
	filter_buttons = filter_button_container.get_children()
	
	# Interlist neighborhoods
	var button_lists = [[infinite_button], minigame_buttons, filter_buttons]
	for i in range(len(button_lists)):
		button_lists[i][0].focus_neighbor_top = button_lists[i][0].get_path_to(play_button)
		for button: Control in button_lists[i]:
			button.focus_neighbor_left = button.get_path_to(menu_button if i == 0 else button_lists[i - 1][0])
			button.focus_neighbor_right = button.get_path_to(play_button if i == len(button_lists) - 1 else button_lists[i + 1][0])
	
	menu_button.focus_neighbor_right = menu_button.get_path_to(play_button)
	menu_button.focus_neighbor_bottom = menu_button.get_path_to(button_lists[0][0])
	
	play_button.focus_neighbor_left = play_button.get_path_to(menu_button)
	play_button.focus_neighbor_bottom = play_button.get_path_to(button_lists[-1][0])
	
	# Grabs initial focus
	button_lists[0][0].grab_focus()


func play():
	var minigame_paths = []
	
	# Save settings
	var setters: Array[Callable] = [Global.set_modifier_settings, Global.set_minigame_settings, Global.set_filter_settings]
	var button_lists = [[infinite_button], minigame_buttons, filter_buttons]
	for i in range(len(button_lists)):
		var settings = []
		for button in button_lists[i]:
			settings.append(button.button_pressed)
		setters[i].call(settings)
	
	# Add minigames
	for minigame_button in minigame_buttons:
		if minigame_button.button_pressed:
			minigame_paths.append_array(minigame_button.get_minigames())
	
	# Erase from filters
	for filter_button in filter_buttons:
		if filter_button.button_pressed:
			for minigame in filter_button.get_minigames():
				minigame_paths.erase(minigame)
	
	if len(minigame_paths) > 0:
		Global.goto_scene_and_call(GAME_PATH, "setup_arcade_mode" if infinite_button.button_pressed else "setup_jam_mode", [minigame_paths])
	else:
		match Global.language:
			Global.LANGUAGE.PT:
				NotificationCenter.notify("Nenhum minigame selecionado!")
			Global.LANGUAGE.EN:
				NotificationCenter.notify("No minigames selected!")

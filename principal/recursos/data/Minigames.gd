extends Node

#region minigame-setup

const minigame_packs = {
	"class_of_2025" : preload("res://principal/recursos/data/packs/class_of_2025.tres"),
	"class_of_2024" : preload("res://principal/recursos/data/packs/class_of_2024.tres"),
	"class_of_2023" : preload("res://principal/recursos/data/packs/class_of_2023.tres"),
	"class_of_2022" : preload("res://principal/recursos/data/packs/class_of_2022.tres"),
	"demo" : preload("res://principal/recursos/data/packs/demo.tres"),
	"godotware": preload("res://principal/recursos/data/packs/godotware.tres"),
	"moraguma":  preload("res://principal/recursos/data/packs/moraguma.tres")
}

# Removed from Moraguma
# "res://microjogos/moraguma/whale_eater/cenas/Main.tscn"

const filters = {
	"no_gore": preload("res://principal/recursos/data/filters/no_gore.tres"),
	"no_luck": preload("res://principal/recursos/data/filters/no_luck.tres")
}

var pack_data = minigame_packs.values() + filters.values()
var minigame_data = [] 

#endregion

#region minigame-run

signal _win(source: Node)
signal _lose(source: Node)

#endregion

func _ready():
	for pack in pack_data:
			minigame_data.append_array(pack.microgames)
		

# Source has to be descendant of current microgame's main node
func register_win(source: Node) -> void:
	_win.emit(source)

func register_lose(source: Node) -> void:
	_lose.emit(source)

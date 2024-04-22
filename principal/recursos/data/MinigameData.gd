@tool
extends Resource

class_name MinigameData

enum MinigameFilter {
	MATURE,
	NO_LUCK
}

@export_category("Informações | Info")
@export var main_scene: PackedScene :
	set(value):
		if value == null: 
			assert(value != null,"Ué")
			push_warning("Main Scene can't be null.")
		main_scene = value
@export var cover: Texture2D
@export_flags("+13", "No Luck") var filters = 0
var difficulty = 0

@export_category("Créditos | Credits")
@export_group("Português")
@export var title_pt: StringName
@export_multiline var credits_pt := ""

@export_group("English")
@export var title_en: StringName
@export_multiline var credits_en := ""

# Returns an Array containing the minigame filters
func get_filter_list() -> Array[MinigameFilter]:
	var list = []
	for filter in MinigameFilter.values():
		if (filters >> filter) & 1:
			list.append(MinigameFilter[filter])
	return list

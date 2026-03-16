extends Node

const DEFAULT_MICROGAME_PATH: String = "res://microjogos"
const MICROGAME_OVERLAY_PATH = "res://principal/cenas/Jogo.tscn"

var current_microgame: MicrogameAsset = null

func _ready() -> void:
	verify_microgame_main(get_tree().current_scene)

func verify_microgame_main(scene: Node) -> void:
	var path = scene.scene_file_path
	
	# False if node path is not in default microgame path
	if not String(path).begins_with(DEFAULT_MICROGAME_PATH):
		push_warning("Scene path (%s) does not begin with default microgame path (%s)" % [path, DEFAULT_MICROGAME_PATH])
		return
		
	# Attempt to find microgame in folder or parent
	var microgame: MicrogameAsset = get_microgame_resource(path)
	if not microgame:
		push_warning("No microgame found at %s" % path)
		return
		
	add_display_with_microgame(microgame)
		
## Attempts to find a microgame resource file in the specified path folder or parenting folders
func get_microgame_resource(path: StringName) -> MicrogameAsset:
	var dir_array: PackedStringArray = String(path).split("/")
	var dir_path: String = "/".join(dir_array)
	
	while dir_path.begins_with(DEFAULT_MICROGAME_PATH):
		for file in DirAccess.get_files_at(dir_path):
			var file_path = dir_path + "/" + file
			if not file_path.ends_with(".tres"):
				continue
			if ResourceLoader.exists(file_path, "MicrogameAsset"):
				var asset = ResourceLoader.load(file_path, "MicrogameAsset")
				if asset is MicrogameAsset:
					return asset
		
		dir_array = dir_array.slice(0, len(dir_array) - 1)
		dir_path = "/".join(dir_array)
	
	return null

func add_display_with_microgame(microgame: MicrogameAsset) -> void:
	Global.goto_scene_and_call(MICROGAME_OVERLAY_PATH, "setup_arcade_mode", [[microgame]])

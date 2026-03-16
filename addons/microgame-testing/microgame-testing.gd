@tool
class_name MicrogameTestingUtil extends EditorPlugin

const CONFIG_PATH: StringName = "user://microgame-testing.cfg"

# Initialization of the plugin goes here.
func _enter_tree() -> void:
	pass
	
func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass

func _enable_plugin() -> void:
	# Add autoloads here.
	add_autoload_singleton("TestOverlayRunner", "res://addons/microgame-testing/scripts/autoloads/overlay-runner.gd")

func _disable_plugin() -> void:
	# Remove autoloads here.
	remove_autoload_singleton("TestOverlayRunner")

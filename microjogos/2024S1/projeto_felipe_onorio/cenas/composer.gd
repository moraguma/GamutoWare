extends Node

# dependencies:
# none

# all dependencies:
# Control -> none
# AudioStreamPlayer -> none
#              main ->                   area_cell_x
#                      status_checker
#                                                       win_animation  (sprite2D)
#       cursor_area -> status_checker
#                                        area_cell_0
#                      get_child(0).get_child(0) (sprite2D)
#                      status_checker -> area_cell_x
#                                        area_cell_x -> get_child(0).get_child(0) (sprite2D)
# chosen order: area_cell_x, status_checker, cursor_area, main

#var components_readiness: Dictionary = {
	#"animations_cell_x": 0,
	#"area_cell_x": 0,
	#"status_checker": false,
	#"cursor_area": false,
	#"main": false
#}
#var components_references: Dictionary = {}
#
#func check_if_all_ready():
	##var groceries = {"Orange": 20, "Apple": 2, "Banana": 4}
	##for fruit in groceries:
		##var amount = groceries[fruit]
	##var all_ready: bool = true
	##for component in components_readiness:
		##if !components_readiness[component]:
			##return false
		#
	#print("checking if all ready")
	#if ( components_readiness["animations_cell_x"] != 9 ||
		 #components_readiness["area_cell_x"] != 9 ||
		 #components_readiness["status_checker"] == false || 
		 #components_readiness["cursor_area"] == false ||
		 #components_readiness["main"] == false ) :
		#return false
	#print("all checked, connecting")
	#connect_dependencies()
	#print("all connected")
	#return true
	#pass

#var registered_components : Dictionary = {}
#func connect_dependencies():
	## chosen order: area_cell_x, status_checker, cursor_area, main
	## area_cell_x already connected
	#components_references["status_checker"].connect_dependencies()
	#components_references["cursor_area"].connect_dependencies()
	#components_references["main"].connect_dependencies()
	#pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#func _on_main_main_ready():
	#components_readiness["main"] = true
	#components_references["main"] = $".."
	#check_if_all_ready()
	#pass # Replace with function body.
#
#func _on_status_checker_status_checker_ready():
	#components_readiness["status_checker"] = true
	#components_references["status_checker"] = $"../status_checker"
	#check_if_all_ready()
	#pass # Replace with function body.
#
#
#func _on_cursor_area_cursor_area_ready():
	#components_readiness["cursor_area"] = true
	#components_references["cursor_area"] = $"../cursor_area"
	#check_if_all_ready()
	#pass # Replace with function body.
#
#func _on_area_cell_0_area_cell_0_ready(area_node):
	#components_readiness["area_cell_x"] = components_readiness["area_cell_x"] + 1
	#components_references["area_cell_x"] = $"../area_cell_0"
	##area_node.connect_dependencies()
	#check_if_all_ready()
	#pass # Replace with function body.
#
#func _on_animations_0_animations_0_ready(animation_node):
	#components_readiness["animations_cell_x"] = components_readiness["animations_cell_x"] + 1
	#components_references["animations_cell_x"] = $"../area_cell_0/Cell_0_hitbox/animations_0"
	## animation_node.connect_dependencies() # no dependencies
	#animation_node.get_parent().get_parent().connect_dependencies()
	#check_if_all_ready()
	#pass # Replace with function body.

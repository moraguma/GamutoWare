extends Node2D
@onready var food_scene = load("res://microjogos/2023S1/projeto-repasch/cenas/comida.tscn")
@onready var food_assets = [
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/10_baguette_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/16_burger_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/19_burrito_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/29_cookies_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/35_donut_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/39_friedegg_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/45_frenchfries_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/47_fruitcake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/56_hotdog_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/66_loafbread_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/70_meatball_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/72_nacho_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/74_omlet_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/76_pudding_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/80_pancakes_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/82_pizza_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/86_roastedchicken_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/89_salmon_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/91_strawberrycake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/93_sandwich_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/94_spaghetti.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/96_steak_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/98_sushi_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/100_taco_dish.png"),
]
@onready var random = RandomNumberGenerator.new()
var last_spawn = 960
func _on_timer_timeout():
	spawn()
	
func spawn():
	var spawn_position = random.randf_range(40.0, 1800.0)
	while abs(spawn_position - last_spawn) > 900 or abs(spawn_position - last_spawn) < 300:
		spawn_position = random.randf_range(40.0, 1800.0)
	last_spawn = spawn_position
	var img_index = randi_range(0, len(food_assets)-1)
	var food_instance : CharacterBody2D = food_scene.instantiate()
	food_instance.position = Vector2(spawn_position, position.y)
	food_instance.get_child(0).texture = food_assets[img_index]
	add_child(food_instance)

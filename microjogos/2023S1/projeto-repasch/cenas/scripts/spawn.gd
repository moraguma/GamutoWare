extends Node2D
@onready var food_scene = load("res://microjogos/2023S1/projeto-repasch/cenas/comida.tscn")
@onready var food_assets = [
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/06_apple_pie_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/08_bread_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/10_baguette_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/12_bun_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/14_bacon_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/16_burger_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/17_burger_napkin.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/19_burrito_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/21_bagel_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/23_cheesecake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/25_cheesepuff_bowl.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/27_chocolate_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/29_cookies_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/31_chocolatecake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/33_curry_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/35_donut_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/37_dumplings_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/39_friedegg_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/41_eggsalad_bowl.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/43_eggtart_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/45_frenchfries_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/47_fruitcake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/49_garlicbread_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/51_giantgummybear_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/53_gingerbreadman_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/56_hotdog_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/58_icecream_bowl.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/60_jelly_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/62_jam_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/64_lemonpie_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/66_loafbread_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/68_macncheese_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/70_meatball_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/72_nacho_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/74_omlet_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/76_pudding_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/78_potatochips_bowl.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/80_pancakes_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/82_pizza_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/84_popcorn_bowl.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/86_roastedchicken_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/87_ramen.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/89_salmon_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/91_strawberrycake_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/93_sandwich_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/94_spaghetti.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/96_steak_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/98_sushi_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/100_taco_dish.png"),
	preload("res://microjogos/2023S1/projeto-repasch/recursos/foods/102_waffle_dish.png")
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

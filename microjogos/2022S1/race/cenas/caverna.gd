extends StaticBody2D

var path = Array()
var poly1 = PoolVector2Array()
var poly2 = PoolVector2Array()
var origin = Vector2(0, 0)
var tileset

const n = 80
const advance = 144
const width = 150
const variance = 20
	
func gen_cave():
	# TODO use OpenSimplexNoise
	var cur_pos = origin
	var local_variance = 0
	var step_variance = 100
	var start_length = 12
	for _i in range(start_length):
		path.append(cur_pos)
		cur_pos += Vector2(advance, 0)

	for _i in range(n-start_length):
		path.append(cur_pos+Vector2(0, randi()%(local_variance*2+1)-local_variance))
		cur_pos += Vector2(advance, randi()%(step_variance*2+1)-step_variance)

func _ready():
	gen_cave()
	for i in path:
		poly1.append(i+Vector2(0, -width+randi()%(variance*2+1)-variance))
	for i in range(path.size()-1, -1, -1):
		poly1.append(path[i]+Vector2(0, -1000))
		
	for i in path:
		poly2.append(i+Vector2(0, width+randi()%(variance*2+1)-variance))
	for i in range(path.size()-1, -1, -1):
		poly2.append(path[i]+Vector2(0, 1000))
		
	var shape1 = get_node("Ceiling")
	var shape2 = get_node("Floor")
	shape1.set_polygon(poly1)
	shape2.set_polygon(poly2)
	
	tileset = preload("res://microjogos/2022S1/race/recursos/tileset.png")

onready var tile_size = 48.0
	
func draw_textured_poly(poly, ceiling):
	var colors = [Color(1,1,1,1),Color(1,1,1,1),Color(1,1,1,1),Color(1,1,1,1)]
	
	for i in range(poly1.size()-1):
		var inverse_mul = 1
		if(ceiling == false):
			inverse_mul = -1
		var delta = poly[i+1]-poly[i]
		
		var inner_left = poly[i]
		var inner_right = poly[i+1]
		var outer_left = poly[i]-inverse_mul*Vector2(0, tile_size)
		var outer_right = poly[i+1]-inverse_mul*Vector2(0, tile_size)
		if(i > 0):
			var normal = (poly[i]-poly[i-1]).normalized()+(poly[i+1]-poly[i]).normalized()
			normal = Vector2(normal.y, -normal.x).normalized()
			outer_left = poly[i]+tile_size*normal*inverse_mul
		if(i < poly1.size()-2):
			var normal = (poly[i+1]-poly[i]).normalized()+(poly[i+2]-poly[i+1]).normalized()
			normal = Vector2(normal.y, -normal.x).normalized()
			outer_right = poly[i+1]+tile_size*normal*inverse_mul
		var inner_dir = (inner_right-inner_left)
		var outer_dir = (outer_right-outer_left)
		
		for l in range(delta.length()/tile_size):
			#var length_scale = (delta.length()/tile_size)/floor(delta.length()/tile_size)
			var step = 1.0/floor(delta.length()/tile_size)
			var t = l*step
			var w = 16.0/128.0
			var uv_pos = w*Vector2(randi()%4, 1)
			var uvs = PoolVector2Array([uv_pos+Vector2(0, w), uv_pos+Vector2(w, w),
										uv_pos+Vector2(w, 0), uv_pos+Vector2(0, 0)])
			
			# TODO: Create 3x upscaled version of tileset and import it as non-pixelart 
			draw_primitive([inner_left+inner_dir*t, inner_left+inner_dir*(t+step),
							outer_left+outer_dir*(t+step), outer_left+outer_dir*t], colors, uvs, tileset)
			
			#var dir = length_scale*tile_size*delta.normalized()
			#var pos = poly[i]+l*dir
			
			#draw_primitive([pos, pos+dir, pos+dir+Vector2(dir.y, -dir.x), pos+Vector2(dir.y, -dir.x)], colors, uvs, tileset)
			
func _draw():
	# Your draw commands here
	var help = Vector2(0, 2000)
	var c = Color(9/255.0,3/255.0,6/255.0,1)
	var colors = [c,c,c,c]
	var poly_offset = Vector2(0, tile_size/2.0)
	for i in range(poly1.size()-1):
		draw_primitive([poly1[i]-poly_offset, poly1[i+1]-poly_offset, poly1[i+1]-help, poly1[i]-help], colors, [])
		draw_primitive([poly2[i]+poly_offset, poly2[i+1]+poly_offset, poly2[i+1]+help, poly2[i]+help], colors, [])
	
	c = Color(1,1,1,1)
	colors = [c,c,c,c]
	
	var stoneCount = 400
	for _i in range(stoneCount):
		var x = randi()%((n-1)*advance)
		var y = 0
		var side = randi()%2
		if(side == 0):
			y = get_poly_y(poly1, x)+(randi()%61-30)-90
		else:
			y = get_poly_y(poly2, x)+(randi()%61-30)+90
		draw_texture_rect_region(tileset, Rect2(x, y, 48, 48), Rect2(48*(randi()%7), 48*(randi()%2+3), 48, 48), c)
	
	draw_textured_poly(poly1, true)
	draw_textured_poly(poly2, false)
	
func get_path_y(x):
	x = clamp(x, 0, (n-2)*advance)
	var index = floor(x/advance)
	return path[index].y + (x-index*advance)*(path[index+1].y-path[index].y)/advance
	
func get_poly_y(poly, x):
	x = clamp(x, 0, (n-2)*advance)
	var index = floor(x/advance)
	return poly[index].y + (x-index*advance)*(poly[index+1].y-poly[index].y)/advance
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

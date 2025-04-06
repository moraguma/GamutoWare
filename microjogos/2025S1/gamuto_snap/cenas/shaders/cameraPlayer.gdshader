shader_type canvas_item;

uniform float flash = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}


vec4 lerp(vec4 a, vec4 b, float w) {
	return a + (b - a) * w; 
}


void fragment() {
	COLOR = lerp(COLOR, vec4(1.0), flash);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

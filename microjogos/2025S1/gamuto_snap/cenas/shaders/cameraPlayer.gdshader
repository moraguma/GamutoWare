shader_type canvas_item;

uniform float flash = 0.0;

vec4 lerp(vec4 a, vec4 b, float w) {
	return a + (b - a) * w; 
}

void fragment() {
	COLOR = lerp(COLOR, vec4(1.0), flash);
}

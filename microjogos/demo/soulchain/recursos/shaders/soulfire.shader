shader_type canvas_item;

uniform vec4 transparent = vec4(0.0); // Let's you edit in editor
uniform vec4 inner = vec4(0.784313, 0.921568, 0.262745, 1.0);
uniform vec4 outer = vec4(0.623529, 0.886274, 0.282352, 1.0);

const float inner_threshold = 0.13;
const float outer_threshold = 0.05;

uniform int OCTAVES = 4;

// Returns a pseudo-random number for each pixel
float rand(vec2 coord) {
	return fract(sin(dot(coord, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Gets the value of the surrounding integer points to get the value of the
// current coordinate, generating a smoother noise texture
float noise(vec2 coord) {
	vec2 i = floor(coord); // Takes the integer bit of the number
	vec2 f = fract(coord); // Takes the decimal (fraction) part of the number
	
	// 4 corners of a rectangle surrounding our point
	float a = rand(i);
	float b = rand(i + vec2(1.0, 0.0));
	float c = rand(i + vec2(0.0, 1.0));
	float d = rand(i + vec2(1.0, 1.0));
	
	vec2 cubic = f * f * (3.0 - 2.0 * f);
	
	return mix(a, b, cubic.x) + (c - a) * cubic.y * (1.0 - cubic.x) + (d - b) * f.x * f.y;
}

// Generates more detailed noise
float fbm(vec2 coord) {
	float value = 0.0;
	float scale = 0.5;
	
	for (int i = 0; i < OCTAVES; i++) {
		value += noise(coord) * scale;
		coord *= 2.0;
		scale *= 0.5;
	}
	return value;
}

float overlay(float base, float top) {
	if (base < 0.5) {
		return 2.0 * base * top;
	} else {
		return 1.0 - 2.0 * (1.0 - base) * (1.0 - top);
	}
}

// UV returns the pixel's coordinate

void fragment() {
	vec2 coord = UV * 8.0;
	vec2 fbm_coord = coord / 5.0;
	
	vec4 tx = texture(TEXTURE, UV);
	float tx_level = tx.r;
	
	float noise1 = noise(coord + vec2(TIME * 0.25 , TIME * 5.0));
	float noise2 = noise(coord + vec2(TIME * 0.5, TIME * 8.0));
	float combined_noise = (noise1 + noise2) / 2.0;
	
	float fbm_noise = fbm(fbm_coord + vec2(0.0, TIME * 3.0));
	fbm_noise = overlay(fbm_noise, UV.y);
	
	float everything_combined = combined_noise * fbm_noise * tx_level;
	
	if (everything_combined < outer_threshold) {
		COLOR = transparent;
	} else if (everything_combined < inner_threshold) {
		COLOR = outer;
	} else {
		COLOR = inner;
	}
}
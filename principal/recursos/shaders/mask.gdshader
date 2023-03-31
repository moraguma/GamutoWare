shader_type canvas_item;

uniform sampler2D mask_texture;

void fragment() {
	COLOR = texture(TEXTURE, UV);;
	
	if(texture(mask_texture, UV).r < 0.5) {
		COLOR.a *= 0.0;
	}
}

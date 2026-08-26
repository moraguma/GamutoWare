shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform int blur_radius : hint_range(1, 16) = 8;
uniform float blur_scale : hint_range(0.0, 10.0) = 1.0;
uniform float darkness : hint_range(0.0, 10.0) = 0.8;

uniform int fade_direction : hint_range(0, 3) = 0;
uniform float fade_cutoff : hint_range(0.0, 1.0) = 0.2;
uniform float fade_intensity : hint_range(0.1, 10.0) = 2.0;

// Precomputed Gaussian weights for radius 16, sigma ≈ 8
const float weights[17] = float[](
    0.196482, 0.175713, 0.121703, 0.066143, 0.028532,
    0.009909, 0.002798, 0.000654, 0.000126, 0.000020,
    0.000002, 0.000000, 0.000000, 0.000000, 0.000000,
    0.000000, 0.000000
);

float calculate_fade(vec2 uv) {
    float fade = 0.0;
    if (fade_direction == 0) fade = uv.x;
    else if (fade_direction == 1) fade = 1.0 - uv.x;
    else if (fade_direction == 2) fade = uv.y;
    else fade = 1.0 - uv.y;

    if (fade < fade_cutoff) return 1.0;
    fade = (fade - fade_cutoff) / (1.0 - fade_cutoff);
    return clamp(pow(1.0 - fade * 2.0, fade_intensity), 0.0, 1.0);
}

void fragment() {
    vec2 uv = SCREEN_UV;
    vec2 offset = vec2(0.0, SCREEN_PIXEL_SIZE.y * blur_scale); // vertical blur
    vec4 blur = texture(SCREEN_TEXTURE, uv) * weights[0];

    for (int i = 1; i <= blur_radius; i++) {
        float w = weights[i];
        vec2 shift = offset * float(i);
        blur += texture(SCREEN_TEXTURE, uv + shift) * w;
        blur += texture(SCREEN_TEXTURE, uv - shift) * w;
    }

    blur.rgb *= darkness;

    float fade = calculate_fade(uv);
    vec4 original = texture(SCREEN_TEXTURE, uv);
    vec4 final_color = mix(original, blur, fade);
    final_color.a = 1.0;

    COLOR = final_color;
}

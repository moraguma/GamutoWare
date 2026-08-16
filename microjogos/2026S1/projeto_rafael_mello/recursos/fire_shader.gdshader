shader_type canvas_item;

// Uniforms pour correspondre aux "extern" originaux
uniform float amount : hint_range(0.0, 10.0) = 0.0;
uniform vec4 texture_details;
uniform vec2 image_details;
uniform vec4 colour_1 : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 colour_2 : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform float id = 0.0;

// Constantes
const float PIXEL_SIZE_FAC = 60.0;
const vec4 WHITE = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
    float intensity = min(10.0, amount);
    
    // Si l'intensité est trop faible, on n'affiche rien
    if (intensity < 0.1) {
        COLOR = vec4(0.0);
    } else {
        // Conversion vers les coordonnées UV locales (0-1) et centrage (-0.5 à 0.5)
        // texture_details.xy = offset, .ba = dimensions
        vec2 uv = ((UV * image_details) - texture_details.xy * texture_details.ba) / texture_details.ba - 0.5;
        
        // Effet de pixelisation
        vec2 floored_uv = floor(uv * PIXEL_SIZE_FAC) / PIXEL_SIZE_FAC;
        vec2 uv_scaled_centered = floored_uv;
        
        // Distorsion de base
        uv_scaled_centered += uv_scaled_centered * 0.01 * (
            sin(-1.123 * floored_uv.x + 0.2 * TIME) * 
            cos(5.3332 * floored_uv.y + TIME * 0.931)
        );
        
        // Mouvement vers le haut (flamme)
        vec2 flame_up_vec = vec2(0.0, mod(4.0 * TIME, 10000.0) - 5000.0 + mod(1.781 * id, 1000.0));

        float scale_fac = (7.5 + 3.0 / (2.0 + 2.0 * intensity));
        vec2 sv = uv_scaled_centered * scale_fac + flame_up_vec;
        float speed = mod(20.781 * id, 100.0) + 1.0 * sin(TIME + id) * cos(TIME * 0.151 + id);
        vec2 sv2 = vec2(0.0, 0.0);

        // Boucle de déformation fractale
        for(int i = 0; i < 5; i++) {
            float iteration_mod = (mod(float(i), 2.0) > 1.0 ? -1.0 : 1.0);
            sv2 += sv + 0.05 * sv2.yx * iteration_mod + 0.3 * (
                cos(length(sv) * 0.411) + 
                0.3344 * sin(length(sv)) - 
                0.23 * cos(length(sv))
            );
            sv += 0.5 * vec2(
                cos(cos(sv2.y) + speed * 0.0812) * sin(3.22 + sv2.x - speed * 0.1531),
                sin(-sv2.x * 1.21222 + 0.113785 * speed) * cos(sv2.y * 0.91213 - 0.13582 * speed)
            );
        }    

        // Calcul de la densité de la "fumée" (smoke_res)
        float smoke_res = max(0.0, (
            (length((sv - flame_up_vec) / scale_fac * 5.0) + 0.1 * (length(uv_scaled_centered) - 0.5)) * 
            (2.0 / (2.0 + intensity * 0.2))
        ));
        
        smoke_res = (intensity < 0.1) ? 1.0 : smoke_res + max(0.0, 2.0 - 0.3 * intensity) * max(0.0, 2.0 * (uv_scaled_centered.y - 0.5) * (uv_scaled_centered.y - 0.5));

        // Bordures latérales
        if (abs(uv.x) > 0.4) {
            smoke_res += 10.0 * (abs(uv.x) - 0.4);
        }
        
        // Trou central / Forme de la flamme
        if (length((uv - vec2(0.0, 0.1)) * vec2(0.19, 1.0)) < min(0.1, intensity * 0.5) && smoke_res > 1.0) {
            smoke_res += min(8.5, intensity * 10.0) * (length((uv - vec2(0.0, 0.1)) * vec2(0.19, 1.0)) - 0.1);
        }

        vec4 ret_col = colour_1;
        
        if (smoke_res > 1.0) {
            // Transparent si smoke_res > 1
            ret_col.a = 0.0;
        } else {
            // Mixage des couleurs sur le bas (dégradé de feu)
            if (uv.y < 0.12) {
                float y_factor = 0.12 - uv.y;
                ret_col.rgb = ret_col.rgb * (1.0 - 0.5 * y_factor) + 2.5 * y_factor * colour_2.rgb;
                ret_col.rgb += ret_col.rgb * (-2.0 + 0.5 * intensity * smoke_res) * y_factor;
            }
            ret_col.a = 1.0;
        }

        // Appliquer la couleur finale
        COLOR = ret_col;
    }
}

shader_type canvas_item;

uniform vec4 shine_color : source_color = vec4(1.0); //Shine color
uniform float alpha_limit : hint_range(0.0, 1.0, 0.1) = 0.0; //Alpha color limit to apply the shine, for example, if you won't to apply the shine to semi-transparent pixels
uniform float cycle_speed : hint_range(0.0, 10.0, 0.1) = 1.0; //Pulse cycle speed
uniform bool full_pulse_cycle = false; //[False = Do the effect and make a pause] [True = Do the effect continuosly]
uniform int mode : hint_range(0, 2, 1) = 0; //[0 = Always off] [1 = Pulse mode] [2 = Always on]

void fragment()
{
	//Check if the effect is enabled
	if (mode > 0)
	{
		//Check the pixel alpha value
		if (COLOR.a >= alpha_limit)
		{
			//Check the mode
			switch (mode)
			{
				case 1: //Pulse mode
				{
					float cycle = sin(TIME * cycle_speed);
					COLOR.rgb = mix(COLOR.rgb, shine_color.rgb, (((cycle >= 0.0) || (full_pulse_cycle)) ? abs(cycle) : 0.0) * shine_color.a);
					break;
				}
				case 2: //Always on
				{
					COLOR.rgb = mix(COLOR.rgb, shine_color.rgb, shine_color.a);
					break;
				}
			}
		}
	}
}
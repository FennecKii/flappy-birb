shader_type canvas_item;

uniform vec4 base_color: source_color;
uniform vec4 shadow_shift: source_color;
uniform vec4 light_shift: source_color;
uniform vec4 target_color: source_color;

void fragment() {
	vec4 pixel_color = texture(TEXTURE, UV);
	if (length(pixel_color.rgba - base_color.rgba) < 0.01){
		COLOR = target_color;
	}
	else if (length(pixel_color.rgba - base_color.rgba) < 0.3){
		COLOR = target_color + light_shift;
	}
	else if (length(pixel_color.rgba - base_color.rgba) < 0.4){
		COLOR = target_color - shadow_shift;
	}
}
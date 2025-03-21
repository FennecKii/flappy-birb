shader_type canvas_item;

uniform vec4 base_color: source_color;
uniform vec4 target_color: source_color;

void fragment() {
	vec4 pixel_color = texture(TEXTURE, UV);
	if (length(pixel_color.rgba - base_color.rgba) < 0.01){
		COLOR = target_color;
	}
}
shader_type canvas_item;

uniform vec4 body_base_color: source_color;
uniform vec4 outline_base_color: source_color;
uniform vec4 mouth_base_color: source_color;
uniform vec4 eye_base_color: source_color;
uniform vec4 shadow_shift: source_color;
uniform vec4 light_shift: source_color;
uniform vec4 body_color: source_color;
uniform vec4 outline_color: source_color;
uniform vec4 mouth_color: source_color;
uniform vec4 eye_color: source_color;

void fragment() {
	vec4 pixel_color = texture(TEXTURE, UV);
	if (length(pixel_color.rgba - body_base_color.rgba) < 0.01){
		COLOR = body_color;
	}
	else if (length(pixel_color.rgba - body_base_color.rgba) < 0.3){
		COLOR = body_color + light_shift;
	}
	else if (length(pixel_color.rgba - body_base_color.rgba) < 0.4){
		COLOR = body_color - shadow_shift;
	}
	else if (length(pixel_color.rgba - outline_base_color.rgba) < 0.01){
		COLOR = outline_color;
	}
	else if (length(pixel_color.rgba - mouth_base_color.rgba) < 0.01){
		COLOR = mouth_color;
	}
	else if (length(pixel_color.rgba - eye_base_color.rgba) < 0.01){
		COLOR = eye_color;
	}
}
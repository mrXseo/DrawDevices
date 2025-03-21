shader_type canvas_item;

uniform vec4 import_color : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//vec4 final_color = texture(TEXTURE, UV);
	vec4 final_color = import_color;
	if (mod(UV.x + UV.y + TIME/10.0, 0.2) < 0.1){
		final_color = mix(final_color, vec4(0,0,0,1), 0.25);
	};
	COLOR = final_color;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

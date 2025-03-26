class_name Tools

static func texture_resize( texture : Texture2D, new_x : int, new_y : int):
	var red_image : Image = texture.get_image()
	red_image.resize(
		red_image.get_width()/red_image.get_width()*new_x,
		red_image.get_height()/red_image.get_height()*new_y,
		Image.INTERPOLATE_LANCZOS)
	texture = ImageTexture.create_from_image(red_image)
	return texture

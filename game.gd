extends Node2D

@onready var pixel_vp_size = $WorldViewport.size

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_viewport_resize()
	get_viewport().connect("size_changed", _on_viewport_resize)
	
	$WorldTexture.texture = $WorldViewport.get_texture()

func _on_viewport_resize():
	scale_pixel_viewport()
	center_pixel_viewport()

func center_pixel_viewport():
	# Get the viewport size (i.e., the screen size)
	var screen_size = get_viewport().get_visible_rect().size
	
	# Calculate the center position
	var center_position = screen_size / 2
	
	# Set the sprite's position to the center
	position = center_position

func scale_pixel_viewport():
	# Get the viewport size (i.e., the screen size)
	var screen_size = get_viewport().get_visible_rect().size
	
	# Calculate scaling factor to fill screen (cover sizing)
	var factor = max(screen_size.x / pixel_vp_size.x, screen_size.y / pixel_vp_size.y)

	scale = Vector2(factor,factor)

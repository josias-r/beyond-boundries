extends Node2D

@export var debug = false

var debug_sprite: Sprite2D
@onready var buffer = VelocityBufferGlobal.get_velocity_buffer("World")

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport().get_visible_rect().size
	buffer.size = viewport_size

	if debug:
		print("Viewport Size: ", buffer.size)
		var debug_gradient = Sprite2D.new()
		debug_gradient.texture = GradientTexture2D.new()
		debug_gradient.scale = Vector2(5,5)
		
		buffer.add_child(debug_gradient)

		buffer.transparent_bg = false

		debug_sprite = Sprite2D.new()
		debug_sprite.texture = buffer.get_texture()
		add_child(debug_sprite)


#func _process(_delta):
	#if debug:
		#debug_sprite.texture = $SubViewport.get_texture()
		#debug_sprite.texture = buffer.get_texture()

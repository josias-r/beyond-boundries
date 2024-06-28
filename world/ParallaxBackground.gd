extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	var vp_size = get_viewport().size
	for child in get_children():
		if child is ParallaxLayer:
			for sprite in child.get_children():
				if sprite is Sprite2D:
					# Center According to 2D editor to parent viewport
					sprite.position = Vector2(sprite.position.x + (vp_size.x/2), sprite.position.y + (vp_size.y/2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

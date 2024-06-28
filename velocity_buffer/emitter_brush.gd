extends Node2D


# Called when the node enters the scene tree for the first time.
func _draw():
	draw_rect(Rect2(Vector2(0,0),Vector2(100,100)),Color(0,0,0,1))
	queue_redraw()

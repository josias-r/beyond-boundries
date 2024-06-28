@tool
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var hair_scene: PackedScene = load("res://generative_entity/cosmetic_nodes/hair.tscn")
	_generate_circular_nodes(20.0, 0.0, 1, 4, hair_scene)
	#_generate_circular_nodes(10.0, 0.0, 1.0, 15, hair_scene)
	
func _generate_circular_nodes(radius: float, start_angle: float, length_percentage: float, amount: int, scene: PackedScene):
	var total_circumference := 2 * PI * radius
	var spacing := total_circumference * length_percentage / amount
	var angle_between_nodes := spacing / radius  # angle in radians
	

	
	# Adjust spacing if needed to ensure we can fit the required number of nodes

	var max_amount := int(total_circumference / spacing)
	if amount > max_amount:
		print("Warning: Amount exceeds the possible number of nodes with the given spacing. Adjusting spacing.")
		angle_between_nodes = (2 * PI) / amount

	for i in range(amount):
		var angle := i * angle_between_nodes + start_angle
		var x := radius * cos(angle)
		var y := radius * sin(angle)

		# Create a new Node2D and set its position
		var node : Node2D = scene.instantiate()
		node.position = Vector2(x, y)
		
		# Create a new Marker2D and add it as a child to the node
		var marker = Marker2D.new()
		marker.gizmo_extents = 1
		node.add_child(marker)
#
		$ControlNode.add_child(node)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

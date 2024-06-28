@tool
extends Node2D

@export var radius: int = 10;
@export var velocity_buffer_name: String

@onready var velocity_buffer := VelocityBufferGlobal.get_velocity_buffer(velocity_buffer_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	#print(velocity_buffer)
	pass


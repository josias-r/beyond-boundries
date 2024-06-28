@tool

class_name Player extends CharacterBody2D

const WALK_SPEED = 100.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0;
const TERMINAL_VELOCITY = 700

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var texture = $Model.get_texture()
	$Skin.texture = texture

func _physics_process(delta):
	if not Engine.is_editor_hint():
		var direction := Input.get_axis("walk_left", "walk_right") * WALK_SPEED
		velocity.x = move_toward(velocity.x, direction, ACCELERATION_SPEED * delta)
		velocity.y = minf(TERMINAL_VELOCITY, velocity.y + gravity * delta)
		move_and_slide()
	

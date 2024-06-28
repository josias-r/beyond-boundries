@tool

extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	#var animplayer = $Mage.find_child("AnimationPlayer") as AnimationPlayer
	#animplayer.play("run")
	$AnimationPlayer2.play("ROTATE_MAGE")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var animplayer = $Mage.find_child("AnimationPlayer") as AnimationPlayer
	animplayer.play("Running_A")
	pass

extends Node2D

var velocity_buffers = {}

func get_velocity_buffer(buffer_name: String) -> SubViewport:
	if velocity_buffers.has(buffer_name):
		return velocity_buffers[buffer_name]
	else:
		var vp := _create_velocity_buffer()
		velocity_buffers[buffer_name] = vp
		return vp

func remove_velocity_buffer(buffer_name: String):
	velocity_buffers.erase(buffer_name)

func _create_velocity_buffer() -> SubViewport:
	var vp := SubViewport.new()
	vp.transparent_bg = true
	vp.render_target_clear_mode = SubViewport.CLEAR_MODE_NEVER
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.handle_input_locally = false
	return vp

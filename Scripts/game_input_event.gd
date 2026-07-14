class_name GameInputEvents

static var direction : Vector2

static func movement_input() -> Vector2:
	direction = Input.get_vector("KeyLeft", "KeyRight", "KeyUp", "KeyDown")
	
	return direction

static func snap_to_cardinal(dir: Vector2) -> Vector2:
	if abs(dir.x) > abs(dir.y):
		return Vector2(sign(dir.x), 0)
	return Vector2(0, sign(dir.y))

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true

static func use_tool() -> bool:
	var use_tool_value : bool = Input.is_action_just_pressed("Act")
	
	return use_tool_value

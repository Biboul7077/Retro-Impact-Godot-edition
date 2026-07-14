extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 180
@export var distance_dodge: float = 52.0

var move_distance_remaining: float = distance_dodge

func _ready() -> void:
	move_distance_remaining = distance_dodge


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var step: float = min(speed, move_distance_remaining)
	player.velocity = player.player_facing_direction * speed
	print(move_distance_remaining)
	player.move_and_slide()
	move_distance_remaining -= step


func _on_next_transitions() -> void:
	if move_distance_remaining <= 0.0:
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass

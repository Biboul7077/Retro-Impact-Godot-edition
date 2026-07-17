class_name PlayableCharacter
extends Resource

@export var character_name: String
@export var base_max_health: float
@export var base_attack: float
@export var base_defense: float

@export var sprite: Texture2D
@export var skills: Array[Skill]

@export var experience: int = 0

var current_max_health: float
var current_attack: float
var current_defense: float

var health : int = 0

func _init() -> void:
	setup_stats.call_deferred()

func setup_stats() -> void:
	health = base_max_health

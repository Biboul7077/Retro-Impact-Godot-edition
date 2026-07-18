class_name GameContext
extends Resource

var instigator: Node
var target: Node = null
var triggerer: Node = null
var origin: Vector2 = Vector2(INF,INF)
var extras: Dictionary = {}

static var SOURCE_SPELL := &"source_spell"
static var SOURCE_ABILITY := &"source_ability"

func get_extras(id: StringName):
	return extras.get(id, null)

func set_extras(id: StringName, value):
	extras[id] = value

class_name Skill
extends Resource

## --- Metadata ---
@export_group("Metadata")
@export var spell_name: String
@export var description: String
@export var icon: Texture2D
@export var prereqs: Array[Prereq] = []
 
## --- Effects ---
@export_group("Effects")
@export var effects: Array[ExecutionEntry] = []

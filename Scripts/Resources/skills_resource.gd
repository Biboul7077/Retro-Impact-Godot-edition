class_name Skill
extends Resource

enum SkillType {NORMAL, SKILL, BURST, PASSIVE}

@export var skill_name: String
@export var skill_type: SkillType
@export var hp: float
@export var atk: float
@export var def: float
@export var sprite: Texture2D

class_name SkillEntity
extends Node2D
## Le "host" générique. N'importe quelle entité de sort (vortex, tornade,
## projectile, zone de soin...) EST une SpellEntity + une EntityData.
## Toute la logique spécifique vient des ComponentData, pas d'un script dédié.

signal trigger_fired(trigger: int, context: GameContext)

var entity_data: EntityData
var base_context: GameContext
var hit_area: Area2D


func setup(p_entity_data: EntityData, context: GameContext) -> void:
	entity_data = p_entity_data
	base_context = context

	if entity_data.base:
		var base_node := entity_data.base.instantiate()
		add_child(base_node)

	for component in entity_data.components:
		component.build(self)


func on_timer_timeout(timer_id: StringName) -> void:
	match timer_id:
		&"on_tick":
			trigger_fired.emit(TriggerBinding.Trigger.ON_TICK, base_context)
		&"on_duration":
			trigger_fired.emit(TriggerBinding.Trigger.ON_DURATION, base_context)
			queue_free()  # la durée de vie de l'entité expire avec ce timer


func on_body_entered(body: Node) -> void:
	var ctx := base_context.with_triggerer(hit_area if hit_area else body)
	ctx.target = body
	trigger_fired.emit(TriggerBinding.Trigger.ON_BODY_ENTERED, ctx)


func on_body_exited(body: Node) -> void:
	var ctx := base_context.with_triggerer(hit_area if hit_area else body)
	ctx.target = body
	trigger_fired.emit(TriggerBinding.Trigger.ON_BODY_EXITED, ctx)


func on_anim_finished() -> void:
	trigger_fired.emit(TriggerBinding.Trigger.ON_ANIM_FINISHED, base_context)

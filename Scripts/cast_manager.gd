class_name CastManager
extends RefCounted
 
static func cast(spell: SpellData, context: GameContext) -> CastResult:
	var result := CastResult.new()
 
	if not spell:
		result.fail("SpellData manquant")
		return result
 
	for prereq in spell.prereqs:
		if not prereq.is_met(context):
			result.fail(prereq.error_message)
 
	if not result.success:
		return result
 
	for entry in spell.effects:
		entry.execute(context)
 
	return result

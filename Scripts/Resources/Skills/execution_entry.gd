class_name ExecutionEntry
extends Resource
 
@export var effect: Effect
@export var target_resolver: TargetResolver
 
func execute(context: GameContext) -> void:
	if not effect:
		return
	var targets: Array[Node] = []
	if target_resolver:
		targets = target_resolver.resolve(context)
	effect.apply(context, targets)

class_name ExecutionEntry
extends Resource
## Correspond exactement à ta capture : Effect + Target Resolver (+ Origin
## Resolver optionnel si l'effet a besoin de spawn quelque chose).
## Une entry = "quoi" + "sur qui".
 
@export var effect: Effect
@export var target_resolver: TargetResolver
 
func execute(context: GameContext) -> void:
	if not effect:
		return
	var targets: Array[Node] = []
	if target_resolver:
		targets = target_resolver.resolve(context)
	effect.apply(context, targets)

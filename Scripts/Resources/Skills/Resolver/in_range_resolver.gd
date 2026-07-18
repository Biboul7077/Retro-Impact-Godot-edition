class_name InRangeResolver
extends TargetResolver

@export var radius: float = 20.0
@export var max_results: int = -1

func resolve(ctx: GameContext) -> Array:
	var origin = get_source(ctx)
	var entities = WorldUtils.get_entities_in_range(origin, radius)
	if max_results <= 0 or entities.size() <= max_results:
		return entities
	return entities.slice(0, max_results)

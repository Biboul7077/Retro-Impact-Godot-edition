class_name TargetResolver
extends Resource

enum Source {INSTIGATOR, TARGET, TRIGGERER}
@export var source: Source
@warning_ignore("unused_parameter")

func check(ctx: GameContext) -> ResolverResult:
	var node = _get_source(ctx)
	if node == null:
		return ResolverResult.error("ContextResolver: source %s is null" % Source.keys()[source])
	return ResolverResult.ok()

func resolve(ctx: GameContext) -> Array:
	return [get_source(ctx)]

func get_source(ctx: GameContext) -> Node2D:
	match source:
		Source.INSTIGATOR: return ctx.instigator
		Source.TARGET: return ctx.target
		Source.TRIGGERER: return ctx.triggerer
	return null

extends Node

var current_scene

func load_scene_default(level: PackedScene):
	await GlobalAnimationTransition.scene_out(GlobalAnimationTransition.animation_side_start)
	call_deferred("_deferred_packed_scene", level)


func load_scene_default_with_callable(
	level: PackedScene, animation_player: AnimationPlayer, scene_in: String, scene_out: String
):
	animation_player.play(scene_in)
	await animation_player.animation_finished
	call_deferred("_deferred_packed_scene_call", level, animation_player, scene_out)


func _deferred_packed_scene_call(
	level: PackedScene, animation_player: AnimationPlayer, scene_out: String
):
	if current_scene:
		current_scene.free()

	current_scene = level.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

	animation_player.play(scene_out)
	await animation_player.animation_finished


func _deferred_packed_scene(level: PackedScene):
	var next_level = level.instantiate()
	get_tree().root.add_child(next_level)

	if current_scene:
		current_scene.free()

	current_scene = next_level
	get_tree().current_scene = current_scene

	await GlobalAnimationTransition.scene_in(GlobalAnimationTransition.animation_side_end)


func load_scene_path(resource_path: String):
	await GlobalAnimationTransition.scene_out(GlobalAnimationTransition.animation_side_start)
	call_deferred("_deferred_scene_path", resource_path)

func _deferred_scene_path(resource_path: String):
	var next_level = load(resource_path).instantiate()

	get_tree().root.add_child(next_level)

	if current_scene:
		current_scene.free()

	current_scene = next_level
	get_tree().current_scene = current_scene

	await GlobalAnimationTransition.scene_in(GlobalAnimationTransition.animation_side_end)

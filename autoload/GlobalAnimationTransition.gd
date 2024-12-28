# class_name GlobalAnimationTransition
extends Node

## This is an AUTOLOADED scene that allows for global scene transitions
## By editing the scene we can add more transition types here that can
## Be called by the Global Scene Manager

@onready var scene_fader: AnimationPlayer = $AnimationPlayer

var animation_side_end: String = "SideEnd"
var animation_side_start: String = "SideStart"

var available_animations := [animation_side_start, animation_side_end]

func scene_in(animation_name: String):
	assert(available_animations.has(animation_name), "animation not available")
	scene_fader.play(animation_name)
	await scene_fader.animation_finished

func scene_out(animation_name: String):
	assert(available_animations.has(animation_name), "animation not available")
	scene_fader.play(animation_name)
	await scene_fader.animation_finished

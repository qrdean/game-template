class_name State extends Node

@export var animation_name: String
@export var move_speed: float = 150

var animations: AnimatedSprite2D
var animation_player: AnimationPlayer
var move_component
var parent: CharacterBody2D

func enter() -> void:
	# animations.play(animation_name)
	animation_player.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null

func get_movement_input() -> Vector2:
	return move_component.get_movement_direction()

func animation_change(new_animation) -> void:
	animation_player.play(new_animation)


class_name BootManager
extends Node

## This is the booting Node that initializes the game structure.
## e.g. the title screen, loading save data, and other services that 
## need to be called at initialize time should be handled here.
## Once the first scene is loaded and _ready() ends node is freed

# we preload the UI so we can instantiate it on boot
@export var initial_scene: PackedScene


func _ready():
	if initial_scene:
		GlobalSceneManager.load_scene_default(initial_scene)
	else:
		print_debug("ERROR: no level set")

	self.queue_free()

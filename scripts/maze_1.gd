extends Node2D

signal level_changed(level_name)

@export () var level_name = "level"

@onready var maze_completed = $Completion_Check
@onready var hint = $Hint

func _process(delta):
	if maze_completed.is_colliding():
		hint.visible = true
		

func _on_button_pressed() -> void:
	emit_signal("level_changed", level_name)

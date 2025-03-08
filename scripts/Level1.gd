extends Node2D

signal level_changed(level_name)

@export () var level_name = "level"

func _on_l_1b_1_pressed() -> void:
	emit_signal("level_changed", level_name)

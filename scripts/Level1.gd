extends Node2D

signal level_changed(level_name)

@export () var level_name = "level"  #level

func _on_l_1b_1_pressed() -> void:     #next level button
	emit_signal("level_changed", level_name)

func _on_l_1b_2_pressed() -> void:     #maze 1 button
	emit_signal("level_changed", level_name + "_m")  #specifies maze

func _on_l_1b_3_pressed() -> void:
	emit_signal("level_changed", level_name + "_s")

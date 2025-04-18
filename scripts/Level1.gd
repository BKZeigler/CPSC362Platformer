extends Node2D

signal level_changed(level_name)

@export () var level_name = "level"  #level
@onready var maze_entrance = $Go_To_Maze
@onready var simon_entrance = $Go_To_Simon
@onready var cipher_entrance = $Go_To_Cipher
@onready var deadzone = $Deadzone

func _process(delta):
	if maze_entrance.is_colliding():
		emit_signal("level_changed", level_name + "_m")
	if simon_entrance.is_colliding():
		emit_signal("level_changed", level_name + "_s")
	if cipher_entrance.is_colliding():
		emit_signal("level_changed", level_name + "_c")
	if deadzone.is_colliding():
		get_tree().reload_current_scene()
		

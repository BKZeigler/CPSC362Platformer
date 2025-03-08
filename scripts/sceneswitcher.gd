extends Node


@onready var current_level = $level1

func _ready() -> void:
	$level1.connect("level_changed", handle_level_changed)
	
func handle_level_changed(current_level_name: String):
	var next_level
	var next_level_name: String
	
	match current_level_name:
		"one":
			next_level_name = "2"
		"two":
			next_level_name = "3"
		#can add here eventually is "three":  pointing to a "you won" scene
		_:
			return
			
		
	
	var temp = load("res://scenes/level" + next_level_name + ".tscn")
	next_level = temp.instantiate()
	call_deferred("add_child",next_level)
	next_level.connect("level_changed",handle_level_changed)
	current_level.queue_free()
	current_level = next_level
	
	

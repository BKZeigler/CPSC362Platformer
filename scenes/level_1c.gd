extends CanvasLayer

signal level_changed(level_name)
@export () var level_name = ""

@onready var line_edit = $inputbox/LineEdit
@onready var next_level = $nextLevel
@onready var fail_msg = $bg1/bg2/correctMsg
@onready var success_msg = $bg1/bg2/correctMsg
@onready var bg_rect = $bg1
@onready var submit_button = $submit


var password = "password"

func _ready():
	print("code is running")
	line_edit.grab_focus()
	next_level.visible = false
	fail_msg.visible = false
	success_msg.visible = false

func _check_password():
	print("check password function called")
	var user_input = line_edit.text
	if user_input == password:
		print("Success")
		fail_msg.visible = false
		success_msg.visible = true
		submit_button.visible = false
		next_level.visible = true
		bg_rect.set_color(Color(0,255,0))
	else:
		bg_rect.set_color(Color(255,0,0))
		fail_msg.visible = true
		print("Fail")
		

func _on_submit_pressed() -> void:
	print("submit button pressed")
	_check_password()
	

func _on_next_level_pressed() -> void:
	print("next level button pressed")
	#idk what to do here

func _on_button_pressed() -> void:
	emit_signal("level_changed", level_name)

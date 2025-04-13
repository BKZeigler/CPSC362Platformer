extends Node2D

@onready var statement: Label = $ColorRect/statement
@onready var restart_s: Button = $"ColorRect/restart s"
@onready var red: Button = $ColorRect/red
@onready var yellow: Button = $ColorRect/yellow
@onready var green: Button = $ColorRect/green
@onready var click_count_label: Label = $"ColorRect/click count"
@onready var timer_label: Label = $ColorRect/timer
@onready var popup_label: Label = $"ColorRect/pop up message"

var statements = [
	"Click Red",
	"Click Yellow",
	"Click Green"
]

var current_statement = ""
var click_count = 0
var time_left = 10.0
var timer_running = false

func _ready():
	randomize()
	
	# Set popup label font color to black
	popup_label.add_theme_color_override("font_color", Color.BLACK)
	
	restart_s.pressed.connect(_on_restart_pressed)
	red.pressed.connect(_on_red_pressed)
	yellow.pressed.connect(_on_yellow_pressed)
	green.pressed.connect(_on_green_pressed)
	start_game()

func _process(delta):
	if timer_running:
		time_left -= delta
		timer_label.text = "Time: %.1f" % time_left
		if time_left <= 0:
			timer_running = false
			timer_label.text = "Time: 0.0"
			end_game()

func start_game():
	click_count = 0
	time_left = 10.0
	timer_running = true
	click_count_label.text = "Clicks: 0"
	timer_label.text = "Time: 10.0"
	popup_label.visible = false
	pick_random_statement()

func pick_random_statement():
	current_statement = statements[randi() % statements.size()]
	statement.text = current_statement

func update_click_count():
	click_count += 1
	click_count_label.text = "Clicks: %d" % click_count
	if click_count >= 20:
		timer_running = false
		end_game()

func end_game():
	if click_count >= 20:
		popup_label.text = "🎉 You Win!"
	else:
		popup_label.text = "⏱️ Time's Up! Try Again"
	popup_label.visible = true

func _on_red_pressed():
	if timer_running and current_statement == "Click Red":
		update_click_count()
		pick_random_statement()

func _on_yellow_pressed():
	if timer_running and current_statement == "Click Yellow":
		update_click_count()
		pick_random_statement()

func _on_green_pressed():
	if timer_running and current_statement == "Click Green":
		update_click_count()
		pick_random_statement()

func _on_restart_pressed():
	start_game()

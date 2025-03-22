extends Node2D

@onready var statement: Label = $ColorRect/statement
@onready var restart_s: Button = $"ColorRect/restart s"
@onready var red: Button = $ColorRect/red
@onready var yellow: Button = $ColorRect/yellow
@onready var green: Button = $ColorRect/green

var statements = [
	"Click Red",
	"Click Yellow",
	"Click Green"
]
var current_statement = ""

func _ready():
	randomize()  # Ensure randomization works properly
	restart_s.pressed.connect(_on_restart_pressed)
	red.pressed.connect(_on_red_pressed)
	yellow.pressed.connect(_on_yellow_pressed)
	green.pressed.connect(_on_green_pressed)
	pick_random_statement()

func pick_random_statement():
	current_statement = statements[randi() % statements.size()]
	statement.text = current_statement

func _on_red_pressed():
	if current_statement == "Click Red":
		pick_random_statement()

func _on_yellow_pressed():
	if current_statement == "Click Yellow":
		pick_random_statement()

func _on_green_pressed():
	if current_statement == "Click Green":
		pick_random_statement()

func _on_restart_pressed():
	pick_random_statement()

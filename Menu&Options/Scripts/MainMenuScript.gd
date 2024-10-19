class_name MainMenu
extends Control

@onready var start_button = $Buttons/StartButton
@onready var option_buttons = $Buttons/OptionsButton
@onready var exit_button = $Buttons/ExitButton
@onready var options_menu = $Options_Menu
@onready var buttons = $Buttons

@export var Home_UI = preload("res://world.tscn") as PackedScene

func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	option_buttons.pressed.connect(_on_option_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	options_menu.exit_option_menu.connect(_on_exit_options_menu)
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(Home_UI)
func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _on_exit_options_menu() -> void:
	options_menu.visible = false
	buttons.visible = true
func _on_option_pressed() -> void:
	options_menu.visible = true
	buttons.visible = false

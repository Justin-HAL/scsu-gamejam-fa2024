
extends Control

@onready var exit_button = $MainContainer/VBoxContainer/Exit_Button
signal exit_option_menu

func _ready() -> void:
	exit_button.pressed.connect(ExitPressed)
	set_process(false)
func ExitPressed() -> void:
	exit_option_menu.emit()
	set_process(false)

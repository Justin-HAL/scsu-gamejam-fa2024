extends Node2D

@onready var health_bar = $"Player/Camera2D/Health icon"
func _process(delta):
	var health = $Player.health
	$Player/Camera2D/purple/Label.text = str($Player.purple_count)
	$Player/Camera2D/green/Label.text = str($Player.green_count)
	$Player/Camera2D/White/Label.text = str($Player.white_count)
	$Player/Camera2D/Blue/Label.text = str($Player.blue_count)
	
	if health == 100:
		health_bar.play("Full")
	elif health > 93:
		health_bar.play("13")
	elif health > 86:
		health_bar.play("12")
	elif health > 79:
		health_bar.play("11")
	elif health > 72:
		health_bar.play("10")
	elif health > 65:
		health_bar.play("9")
	elif health > 58:
		health_bar.play("8")
	elif health > 51:
		health_bar.play("7")
	elif health > 44:
		health_bar.play("6")
	elif health > 37:
		health_bar.play("5")
	elif health > 30:
		health_bar.play("4")
	elif health > 0:
		health_bar.play("3")
	else:
		health_bar.play("2")
	

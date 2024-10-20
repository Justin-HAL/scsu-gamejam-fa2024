extends Node2D

signal collected
signal respawned
@export var resource : resource_node
var show = false
var player_in_range = false
var player = null

func _ready():
	$Label.visible = false

func _process(delta: float) -> void:
	if player_in_range:
		if Input.is_action_just_pressed("collect"):
			show = true
				

		

	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_range = true
		player = body
		$Label.visible = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_range = false
		player = null
		$Label.visible = false
		show = false

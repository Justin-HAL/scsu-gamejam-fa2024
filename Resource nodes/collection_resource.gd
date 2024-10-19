extends Node2D

@export var type = "resource"
@export var resource : resource_node
var can_collect = true
var player_in_range = false
var player = null
func _ready():
	$Sprite2D.texture = resource.full_texture
	
func _process(delta: float) -> void:
	if player_in_range:
		if Input.is_action_just_pressed("collect"):
			if can_collect:
				harvest()

func harvest():
	can_collect = false
	$Sprite2D.texture = resource.depleted_texture
	player.collect(resource.resource)
	$regrow.start(resource.regrow)
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_range = true
		player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_range = false
		player = null


func _on_regrow_timeout() -> void:
	if !can_collect:
		can_collect = true
		$Sprite2D.texture = resource.full_texture

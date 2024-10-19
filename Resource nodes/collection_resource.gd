extends Node2D

@export var type = "resource"
@export var resource : resource_node
var can_collect = true
var player_in_range = false
func _ready():
	$Sprite2D.texture = resource.full_texture
	
func get_resource():
	if can_collect:
		harvest()
		return resource.resource

func harvest():
	can_collect = false
	$Sprite2D.texture = resource.depleted_texture
	
	



	

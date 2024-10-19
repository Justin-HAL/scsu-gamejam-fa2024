extends Node2D

var type = "resource"
@export var resource : resource_node
var can_collect = true
var player_in_range = false
func _ready():
	$Sprite2D.texture = resource.full_texture
	

	



	

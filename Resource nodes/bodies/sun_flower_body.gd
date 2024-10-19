extends StaticBody2D

@onready var spirte = $Sprite2D



func _on_collection_resource_collected() -> void:
	print("signal: collected")
	visible = false
	$collision.disabled = true


func _on_collection_resource_respawned() -> void:
	print("signal: respawned")
	visible = true
	$collision.disabled = false

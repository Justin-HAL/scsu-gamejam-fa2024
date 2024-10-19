extends StaticBody2D




func _on_collection_resource_collected() -> void:
	visible = false
	$collision.disabled = true

func _on_collection_resource_respawned() -> void:
	visible = true
	$collision.disabled = false

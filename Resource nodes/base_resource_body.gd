extends StaticBody2D




func _on_collection_resource_collected() -> void:
	self.visible = false


func _on_collection_resource_respawned() -> void:
	self.visible = true

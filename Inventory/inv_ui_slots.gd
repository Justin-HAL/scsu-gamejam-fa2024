extends Panel


@export var item_visual: Sprite2D

func _ready():
	item_visual = $display_item

func update(item: Inv_item):
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture

extends Panel


@export var item_visual: Sprite2D
@onready var amount_text: Label = $Label
func _ready():
	item_visual = $display_item

func update(slot: InvSlot):
	if !slot.inv_item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.inv_item.texture
		amount_text.visible = true
		amount_text.text = str(slot.amount)

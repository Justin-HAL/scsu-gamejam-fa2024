extends Resource

class_name inventory

signal update
@export var slots: Array[InvSlot]

func insert(item: Inv_item):
	print("inserting item")
	var itemslots = slots.filter(func(slot): return slot.inv_item ==item)
	if !itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.inv_item==null)
		if !emptyslots.is_empty():
			emptyslots[0].inv_item = item
			emptyslots[0].amount = 1
	update.emit()

func get_slot(index: int):
	return slots[index]
			

extends Control

@onready var inv: inventory = preload("res://Inventory/player_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var is_open = false

func _ready():
	update_slots()
	inv.update.connect(update_slots)
	close()
	
func update_slots():
	for i in range(min(inv.slots.size(),slots.size())):
		slots[i].update(inv.slots[i])
		
func close():
	visible = false
	is_open = false

func open():
	visible = true
	is_open =true

func _process(delta):
	
	if Input.is_action_just_pressed("inventory_toggle"):
		if is_open:
			close()
		else:
			open()

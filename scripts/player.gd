extends CharacterBody2D


@export var speed = 64
@export var health = 100
@export var inv: inventory
@export var item: Inv_item
var type = "player"
var resources_in_range = []
func _ready():
	pass
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	get_invetory()
	$ProgressBar.value = health
	move_and_slide()

func collect(item):
	print("collecting item")
	inv.insert(item)
func get_invetory():
	item = inv.slots[0].inv_item
	if item != null:
		print(item.name)
	
func player():
	pass

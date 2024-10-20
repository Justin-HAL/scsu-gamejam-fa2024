extends CharacterBody2D


@export var default_speed: int = 200
@export var health: int = 100
@export var inv: inventory
@export var item: Inv_item
var type = "player"
var resources_in_range = []
var direction
#/////////////////////////////////////////////
var boost: int = 0
var use_boost = false
#////////////////////////////////////////////
var blue_count = 0
var purple_count = 0
var white_count = 0
var green_count = 0
#////////////////////////////////////////////
var can_walk_on_water: bool = true	
func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	var speed = default_speed + boost
	velocity = direction * speed
	get_invetory()
	
	if Input.is_action_just_pressed("collect"):
		health -= 7

	move_and_slide()

func collect(item):
	print("collecting item")
	inv.insert(item)
	
	#before accessing invetory, make sure the item is not null
func get_invetory():
	item = inv.slots[0].inv_item
	if item != null:
		pass

func speed_boost(add_speed:int):
	boost = add_speed
	$"Speed_ timer".start(3)
	print("starting timer")
	

func _on_speed__timer_timeout() -> void:
	boost = 0
	
func dash(distance: int):
	position += direction * distance
func player():
	pass

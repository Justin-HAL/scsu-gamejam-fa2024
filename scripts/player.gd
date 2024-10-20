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
var blue_count = 5
var purple_count = 5
var white_count = 5
var green_count = 1000
#////////////////////////////////////////////
var can_walk_on_water: bool = false
#////////////////////////////////////////////
@onready var default_texture: Texture2D = preload("res://sprites/new sprite/npc and enemies/vil.png")
@onready var snail_texture:Texture2D = preload("res://sprites/new sprite/npc and enemies/Potion slug.png")
var transformed = false

func _ready():
	$Sprite2D.texture = default_texture
func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	var speed = default_speed + boost
	velocity = direction * speed
	get_invetory()
	
	if Input.is_action_just_pressed("water"):
		if blue_count > 0:
			can_walk_on_water = !can_walk_on_water
			$"Water timer".start(10)
			blue_count -= 1
	if Input.is_action_just_pressed("transform"):
		if purple_count > 0:
			transformed = true
			transformation()
			purple_count -= 1
	if Input.is_action_just_pressed("speed"):
		if white_count > 0:
			speed_boost(60,3)
			white_count -= 1
	if Input.is_action_just_pressed("dash"):
		if green_count > 0:
			dash(50)
			green_count -= 1
	
		
	move_and_slide()

func collect(item):
	print("collecting item")
	inv.insert(item)
	
	#before accessing invetory, make sure the item is not null
func get_invetory():
	item = inv.slots[0].inv_item
	if item != null:
		pass

func speed_boost(add_speed:int, time:int):
	boost = add_speed
	$"Speed_ timer".start(time)
	print("starting timer")
	

func _on_speed__timer_timeout() -> void:
	boost = 0
	print("end time")
	
func dash(distance: int):
	position += direction * distance
func transformation():
	
	if transformed:
		$Sprite2D.texture=snail_texture
		$"Main collision".disabled = true
		$transfomr_timer.start(10)
		
func player():
	pass


func _on_water_timer_timeout() -> void:
	can_walk_on_water = false


func _on_transfomr_timer_timeout() -> void:
	transformed = false
	$Sprite2D.texture= default_texture
	$"Main collision".disabled = false

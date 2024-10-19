extends CharacterBody2D


@export var speed = 200
@export var health = 100
@export var inv: inventory
@export var item: Inv_item
var type = "player"
var resources_in_range = []
func _ready():
	collect(item)
	collect(item)
	collect(item)
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	$ProgressBar.value = health
	move_and_slide()

func collect(item):
	print("collecting item")
	inv.insert(item)


func _on_collection_area_body_entered(body: Node2D) -> void:
	if body.type == "resource":
		resources_in_range.append(body.get_instance_id()) 
		print(resources_in_range)

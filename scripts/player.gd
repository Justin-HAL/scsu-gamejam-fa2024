extends CharacterBody2D


@export var speed = 200
@export var health = 100
@export var inv: inventory
@export var item: Inv_item

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

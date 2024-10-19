extends CharacterBody2D


@export var speed = 200
@export var health = 100
@export var inv: inventory

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	$ProgressBar.value = health
	move_and_slide()

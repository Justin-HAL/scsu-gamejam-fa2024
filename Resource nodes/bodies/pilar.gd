extends CharacterBody2D


@export var SPEED = 205


var starting_position = self.position
var end_distance = 1500
func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.x = 1 * SPEED
	if position.x > starting_position.x + end_distance:
		print("queue free")
		self.queue_free()
	move_and_slide()


func _on_kill_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		body.position = Vector2(0,0)

extends CharacterBody2D

@export var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speed > 0:
		$AnimatedSprite2D.play("default")
		position.x += speed
		if $RayCast2D.is_colliding():
			$RayCast2D.rotation = 0
			speed = -speed
	elif speed < 0:
		position.x += speed
		$AnimatedSprite2D.play("default")
		if $RayCast2D.is_colliding():
			$RayCast2D.rotation = 180
			speed = -speed

func _on_hurt_box_body_entered(body):
	if body.is_in_group("player"):
		queue_free()

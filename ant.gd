extends CharacterBody2D

@export var speed: int
@export var direction: int

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = randf_range(1, speed)
	direction = randf_range(0, direction)
	# pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speed > 0:
		$AnimatedSprite2D.play("default")
		position.x += speed
		if $leftRight.is_colliding():
			$leftRight.target_position.x = -16
			speed = -speed
	elif speed < 0:
		position.x += speed
		$AnimatedSprite2D.play("default")
		if $leftRight.is_colliding():
			$leftRight.target_position.x = 16
			speed = -speed
	if direction < 0:
		$upDown.target_position.y = 16
		$AnimatedSprite2D.play("default")
		position.y += direction
		if $upDown.is_colliding():
			$upDown.target_position.y = -16
			direction = -direction
	elif direction > 0:
		$upDown.target_position.y = -16
		$AnimatedSprite2D.play("default")
		position.y += direction
		if $upDown.is_colliding():
			$upDown.target_position.y = 16
			direction = -direction
		
		
			

func _on_hurt_box_body_entered(body):
	if body.is_in_group("player"):
		print("hit player")
	

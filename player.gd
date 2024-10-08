extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		position.y -= 5
	if Input.is_action_pressed("down"):
		position.y += 5
	if Input.is_action_pressed("right"):
		position.x += 5
	if Input.is_action_pressed("left"):
		position.x -= 5
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite2D.play("default")
	elif Input.is_action_just_released("attack"): $AnimatedSprite2D.stop()
		
	move_and_slide()

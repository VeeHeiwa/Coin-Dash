extends Area2D

export (int) var speed
var velocity =  Vector2()
var screen_size = Vector2(480,720)

func get_input():
	if Input.is_action_pressed('left'):
		velocity.x = -1
	elif Input.is_action_pressed('right'):
		velocity.x = 1
	elif Input.is_action_pressed('down'):
		velocity.y = 1
	elif Input.is_action_pressed("up"):
		velocity.y = -1
	else:
		velocity.x = 0
		velocity.y = 0
	
	if velocity.length() > 0:
		velocity = velocity.normalized()

func start():
	position = screen_size / 2
	
func die():
	$AnimatedSprite.play('hurt')
	set_process(false)


func _ready():
	start()


func _process(delta):
	# Getting input
	get_input()
	# changing position every frame
	position += velocity * speed * delta
	
	# Changing animation
	if velocity.x != 0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.play("idle")
	

func _on_ThePlayer_area_entered(area):
	
	# Picking up coin 
	if area.is_in_group('coins'):
		area.pickup()
		
	# if run into obstacles then die.
	if area.is_in_group('obstacles'):
		die()

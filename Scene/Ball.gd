extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6
@onready var bounce_sound = $"Bounce sound"


#call when the node enters the scene for the first time.
func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
	#randomize starting position and direction
	position.x = 0
	position.y = randi_range(200, win_size.y -200)
	speed = START_SPEED
	dir = random_direction()
	
	#called every frame. "delta" is the elapsed time since the previous frame
func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#if ball hit paddle
		if collider == $"../Players" or collider == $"../CPU":
			speed += ACCEL
			dir = new_direction(collider)
			bounce_sound.play()
		#if ball hit wall
		else:
			dir = dir.bounce(collision.get_normal())
	
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randi_range(-1, 1)
	return new_dir.normalized()
	
func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (collider.p_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()

extends CharacterBody2D

var win_size : Vector2

#Ball start speed
const START_SPEED : int = 500

# Ball acceleration
const ACCEL : int = 50

var speed : int
var dir : Vector2

func _ready():
	win_size = get_viewport_rect().size
	
func new_ball():
	#randomize ball starting direction and position
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	
	#Call to get a random direction
	dir = random_direction()
	
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	
	return new_dir.normalized()

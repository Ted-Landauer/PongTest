extends StaticBody2D

#stores location of the ball for the CPU
var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#move paddle towards the ball
	## get the ball position and other aspects
	ball_pos = $"../Ball".position
	
	## get how far away the paddle is from the ball
	dist = position.y - ball_pos.y
	
	## move the CPU paddle according to 
	### check for preventing a divide by 0 error
	if abs(dist) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (dist / abs(dist))
	else:
		move_by = dist
	
	## actually move the paddle
	position.y -= move_by
	
	# Set paddle bounds
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
	
	
	
	

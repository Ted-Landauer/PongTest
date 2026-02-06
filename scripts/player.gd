extends StaticBody2D

# store the window height
var win_height : int

# store the paddle height
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set the values declared above
	win_height = get_viewport_rect().size.y
	p_height - $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#accept player input and move accordingly
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta
		
	# limit paddle movement to the window
	## do a test print for the x and y values listed in the clamp function.
	### hopefully makes it easier to understand why we chose those numbers
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
		

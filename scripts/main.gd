extends Sprite2D

# Array for scoring: Player, CPU
var score := [0, 0]

# Set the Paddle Speed
const PADDLE_SPEED : int = 500

func _on_ball_timer_timeout() -> void:
	$Ball.new_ball()

#CPU Scoring
func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()
	
	if score[1] == 5:
		$GameOver/WinnerMessage.text = "CPU Wins"
		$GameOver.visible = true
		print("Game Over: CPU Wins")
		$BallTimer.stop()

#Player Scoring
func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()
	
	if score[0] == 5:
		$GameOver/WinnerMessage.text = "Player Wins"
		$GameOver.visible = true
		print("Game Over: Player Wins")
		$BallTimer.stop()


func _on_new_game_button_pressed() -> void:
	$GameOver.visible = false
	score[0] = 0
	$HUD/PlayerScore.text = str(score[0])
	
	score[1] = 0
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()
	

func _on_exit_game_button_pressed() -> void:
	get_tree().quit()

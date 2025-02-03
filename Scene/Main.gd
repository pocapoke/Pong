extends Node2D

var score := [0, 0]
const PADDLE_SPEED : int = 500
@onready var game_start = $"Ball Timer/Game start"
@onready var win = $Win
@onready var lose = $Lose



func _on_ball_timer_timeout():
	game_start.play()
	$Ball.new_ball() # Replace with function body.


func _on_score_left_body_entered(_body):
	score [1] += 1
	$"Hud/CPU's score".text = str (score[1])
	$"Ball Timer".start()
	lose.play()

func _on_score_right_body_entered(_body):
	score [0] += 1
	$"Hud/Player's score".text = str(score[0])
	$"Ball Timer".start()
	win.play()

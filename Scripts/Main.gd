extends Node2D

var score = 0
var time_left = 30

@onready var restart_button = $RestartButton
@onready var score_label = $ScoreLabel
@onready var timer_label = $TimerLabel
@onready var ball = $Ball
@onready var game_timer = $GameTimer

func _ready():
	ball.ball_clicked.connect(_on_ball_clicked)

func _process(delta):
	if game_timer.time_left > 0:
		timer_label.text = "Time: " + str(ceil(game_timer.time_left))

func _on_ball_clicked():
	if game_timer.time_left > 0:
		score += 1
		score_label.text = "Score: " + str(score)

func _on_game_timer_timeout():
	ball.game_over = true
	ball.set_process(false)

	timer_label.text = "Game Over!"

	restart_button.visible = true


func _on_restart_button_pressed():
	get_tree().reload_current_scene()

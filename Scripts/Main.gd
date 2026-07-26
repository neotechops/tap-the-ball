extends Node2D

var score = 0
var time_left = 30
var high_score = 0

@onready var high_score_label = $HighScoreLabel
@onready var restart_button = $RestartButton
@onready var score_label = $ScoreLabel
@onready var timer_label = $TimerLabel
@onready var ball = $Ball
@onready var game_timer = $GameTimer

func _ready():
	ball.ball_clicked.connect(_on_ball_clicked)
	load_high_score()

func _process(_delta):
	if game_timer.time_left > 0:
		timer_label.text = "Time: " + str(ceil(game_timer.time_left))

func _on_ball_clicked():
	if game_timer.time_left > 0:
		score += 1
		score_label.text = "Score: " + str(score)
		
	if score > high_score:
			high_score = score
			high_score_label.text = "High Score: " + str(high_score)
			save_high_score()	

func _on_game_timer_timeout():
	ball.game_over = true
	ball.set_process(false)

	timer_label.text = "Game Over!"

	restart_button.visible = true


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	
func load_high_score():
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		high_score = file.get_32()
		file.close()

	high_score_label.text = "High Score: " + str(high_score)	

func save_high_score():
	var file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_32(high_score)
	file.close()

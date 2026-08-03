extends Area2D

signal ball_clicked

var speed = Vector2(250, 250)
var game_over = false

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _ready():
	randomize()

func _process(delta):
	if game_over:
		return

	position += speed * delta

	var screen_size = get_viewport_rect().size

	var half_width = sprite.texture.get_width() * sprite.scale.x / 2
	var half_height = sprite.texture.get_height() * sprite.scale.y / 2

	if position.x < half_width:
		position.x = half_width
		speed.x *= -1

	if position.x > screen_size.x - half_width:
		position.x = screen_size.x - half_width
		speed.x *= -1

	if position.y < half_height:
		position.y = half_height
		speed.y *= -1

	var bottom_offset = 8

	if position.y > screen_size.y - half_height + bottom_offset:
		position.y = screen_size.y - half_height + bottom_offset
		speed.y *= -1


func _input_event(_viewport, event, _shape_idx):
	if game_over:
		return

	if event is InputEventMouseButton and event.pressed:
		animation_player.play("Pop")
		AudioManager.play_ball_pop()
		ball_clicked.emit()
		move_to_random_position()


func move_to_random_position():
	var screen_size = get_viewport_rect().size

	var half_width = sprite.texture.get_width() * sprite.scale.x / 2
	var half_height = sprite.texture.get_height() * sprite.scale.y / 2

	position.x = randf_range(half_width, screen_size.x - half_width)
	position.y = randf_range(half_height, screen_size.y - half_height)

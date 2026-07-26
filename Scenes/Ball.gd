extends Area2D

signal ball_clicked

var speed = Vector2(250, 250)
var game_over = false

@onready var sprite = $Sprite2D

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

	if position.y > screen_size.y - half_height:
		position.y = screen_size.y - half_height
		speed.y *= -1


func _input_event(_viewport, event, _shape_idx):
	if game_over:
		return

	if event is InputEventMouseButton and event.pressed:
		ball_clicked.emit()

		var screen_size = get_viewport_rect().size

		position.x = randf_range(
			sprite.texture.get_width() * sprite.scale.x / 2,
			screen_size.x - sprite.texture.get_width() * sprite.scale.x / 2
		)

		position.y = randf_range(
			sprite.texture.get_height() * sprite.scale.y / 2,
			screen_size.y - sprite.texture.get_height() * sprite.scale.y / 2
		)

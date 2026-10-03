extends Area2D

var dark = 0
var light = 1
var is_fading = false

@onready var cave_light: TextureRect = $"../Player/Camera2D/CaveLight"
@onready var caveshape = $"../CaveLight2/CollisionShape2D2"
@onready var player = $"../Player"


func _process(_delta):
	var shape = caveshape.shape
	
	if shape is RectangleShape2D:
		var rect = Rect2(
			caveshape.global_position - shape.size / 2,
			shape.size
		)
		
		if rect.has_point(player.global_position):
			var tween = create_tween()
			tween.tween_property(cave_light, "modulate:a", 0.9, 0.6)
			dark = 1
			light = 0
		else:
			var tween = create_tween()
			tween.tween_property(cave_light, "modulate:a", 0, 0.6)
			dark = 0
			light = 1

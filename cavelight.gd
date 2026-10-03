extends Area2D

var dark = 0
var light = 1
var is_fading = false

@onready var cave_light: TextureRect = $"../CaveLight"

func _on_body_entered(body: Node2D) -> void:
	print("ENTERED: ", body.name)
	if is_fading:
		return
		
	is_fading = true

	if dark == 0:
		cave_light.modulate.a = 0.1
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.2
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.3
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.4
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.5
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.6
		dark = 1
		light = 0
	else:
		cave_light.modulate.a = 0.6
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.5
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.4
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.3
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.2
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0.1	
		await get_tree().create_timer(0.1).timeout
		cave_light.modulate.a = 0
		dark = 0
		light = 1
		
	is_fading = false

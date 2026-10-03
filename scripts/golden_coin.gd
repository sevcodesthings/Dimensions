extends Area2D

var coins: int = 0

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
		$AnimatedSprite2D.play("claim")
		await get_tree().create_timer(0.5).timeout
		queue_free()

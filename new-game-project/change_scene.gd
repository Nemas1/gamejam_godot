extends Area2D

@export var target_scene: PackedScene



func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and target_scene:
		get_tree().change_scene_to_packed(target_scene)

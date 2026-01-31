<<<<<<< HEAD
extends Area2D

@export var target_scene: PackedScene



func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and target_scene:
		get_tree().change_scene_to_packed(target_scene)
=======
extends Node2D

@export var scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
>>>>>>> neluzes

extends TextureRect

@onready var timer: Timer

var textures: Array[Texture2D] = [
	preload("res://assets/gas_mask/gas100.png"),
	preload("res://assets/gas_mask/gas80.png"),
	preload("res://assets/gas_mask/gas60.png"),
	preload("res://assets/gas_mask/gas40.png"),
	preload("res://assets/gas_mask/gas20.png"),
	preload("res://assets/gas_mask/gas0.png"),
]

var current_index: int = 0

func _ready():
	texture = textures[current_index]
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0  
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	timer.start()

func _on_timer_timeout():
	current_index += 1
	if current_index < textures.size():
		texture = textures[current_index]
	else:
		visible = false
		timer.stop()

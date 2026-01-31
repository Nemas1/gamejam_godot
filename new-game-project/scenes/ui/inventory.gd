extends Control

signal opened
signal closed

var isOpen: bool = false


@export var player: Player
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update()

func update():
	for i in range(min(player.inventory.items.size(), slots.size())):
		slots[i].update(player.inventory.items[i])

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()

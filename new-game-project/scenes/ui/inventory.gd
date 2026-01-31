extends Control

signal opened
signal closed

var isOpen: bool = false

@export var player: Player
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	connectSlots()
	update()

func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

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

func onSlotClicked(slot):
	pass

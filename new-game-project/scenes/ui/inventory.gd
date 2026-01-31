extends Control

signal opened
signal closed

var isOpen: bool = false

@export var player: Player
@export var hotbar: Hotbar
@onready var ItemStackClass = preload("res://scenes/ui/itemStack.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var itemInHand: ItemStack = null


func _ready():
	connectSlots()
	update()

func _process(delta: float) -> void:
	updateItemInHand()

func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(player.inventory.slots.size(), slots.size())):
		var inventorySlot: InventorySlot = player.inventory.slots[i]
		if !inventorySlot: continue
		
		var itemStack: ItemStack = slots[i].itemStack
		if !itemStack:
			itemStack = ItemStackClass.instantiate()
			slots[i].insert(itemStack)
			
		itemStack.inventorySlot = inventorySlot
		itemStack.update()
	

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()

func onSlotClicked(slot):
	if !slot.itemStack:
		return

	hotbar.set_item(slot.itemStack.inventorySlot)

func updateItemInHand():
	if !itemInHand: return
	
	itemInHand.global_position = get_global_mouse_position()
	
func _input(event):
	updateItemInHand()

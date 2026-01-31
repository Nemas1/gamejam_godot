extends Button
class_name HotbarSlot

@onready var container: CenterContainer = $CenterContainer
@onready var ItemStackScene = preload("res://scenes/ui/itemStack.tscn")

var itemStack: ItemStack = null

func set_item(from_slot: InventorySlot):
	clear()

	if !from_slot or !from_slot.item:
		return

	itemStack = ItemStackScene.instantiate()
	itemStack.inventorySlot = from_slot
	itemStack.update()
	container.add_child(itemStack)

func clear():
	if itemStack:
		itemStack.queue_free()
		itemStack = null

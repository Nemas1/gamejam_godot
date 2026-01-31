extends HBoxContainer
class_name Hotbar

@onready var slot: HotbarSlot = $hotbar_slot

func set_item(from_inventory_slot: InventorySlot):
	slot.set_item(from_inventory_slot)

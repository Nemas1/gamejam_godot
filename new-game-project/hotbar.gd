extends HBoxContainer
class_name Hotbar

@export var slot: HotbarSlot

func set_item(from_inventory_slot: InventorySlot):
	slot.set_item(from_inventory_slot)

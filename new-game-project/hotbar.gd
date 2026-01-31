extends HBoxContainer

@onready var inventory: Inventory = preload("res://player_inventory.tres")
@onready var slots: Array = get_children()

func update() -> void:
	for i in range(slots.size()):
		var inventory_slot: InventoryItem = inventory.slots[i]
		slots[i].update_to_slot(inventory_slot)
	

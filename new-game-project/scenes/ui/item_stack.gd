extends Panel
class_name ItemStack

@onready var itemSprite: Sprite2D = $item

var inventorySlot: InventorySlot

func update():
	if not itemSprite:
		push_error("ItemStack: itemSprite node not found!")
		return

	if not inventorySlot or not inventorySlot.item:
		itemSprite.visible = false
		return

	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture

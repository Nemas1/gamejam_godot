extends Panel

class_name ItemStack

@onready var itemSprite: Sprite2D = $item

var inventorySlot: InventorySlot

func update():
	if !inventorySlot || !inventorySlot.item:
		itemSprite.visible = false
		return

	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture

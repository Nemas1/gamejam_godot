extends Button

@onready var backgroundSprite: Sprite2D = $background
@onready var container: CenterContainer = $CenterContainer
var itemStack: ItemStack

func insert(isg: ItemStack):
	itemStack = isg
	container.add_child(itemStack)

func takeItem():
	if !itemStack:
		return null

	var item = itemStack
	container.remove_child(itemStack)
	itemStack = null
	return item

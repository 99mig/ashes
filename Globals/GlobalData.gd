extends Node

"""
Main
"""
const MainGameStateMachine : String = "res://Managers/StateMachine/MainStateMachine.tscn"

enum MainGameState {
	Start,
	Playmat,
	SelectComponent,
	EditComponent
}

"""
Map
"""
enum MapComponent {
	Background,
	CardSlot,
	HeroSlot,
	DisciplineSlot,
	EquipSlot,
	DeckSlot,
	GraveyardSlot,
	InstantSlot,
	HandHolder,
	GlobalHolder
}

"""
Scenes
"""

const CardComponentScene : String = "res://Components/Card/Card.tscn"
const SlotComponentScene : String = "res://Components/Map/Components/Slots/Slot.tscn"

"""
Actions
"""
enum ActionType {
	SelectComponent,
	EditComponent,
	DragComponent
}
# Diccionario que mapea estados a acciones permitidas
var ActionsOnState: Dictionary = {
	MainGameState.Start: [],
	MainGameState.Playmat: [ActionType.SelectComponent],
	MainGameState.SelectComponent: [],
	MainGameState.EditComponent: [ActionType.DragComponent, ActionType.EditComponent]
}

# Diccionario que mapea tipos de objetos a acciones válidas
var ValidComponentAction: Dictionary = {
	"Holder": [ActionType.SelectComponent, ActionType.EditComponent, ActionType.DragComponent],
	"Slot": [ActionType.SelectComponent, ActionType.EditComponent, ActionType.DragComponent]
}


"""
Blocks
"""
enum BLOCK_RARITY {
	Common,
	Uncommon,
	Rare,
	Epic,
	Legendary,
	Mythic
}

enum BLOCK_TYPE {
	Block,
	EmptyBlock,
	Slot,
	EmptySlot,
	Holder,
	EmptyHolder
}

const BLOCKS_INDEX: Dictionary = {
	EmptyBlock_01 = "res://Static/Resources/Objects/Blocks/00/EmptyBlock_01.tres",
	EmptyBlock_02 = "res://Static/Resources/Objects/Blocks/00/EmptyBlock_02.tres",
	EmptyBlock_03 = "res://Static/Resources/Objects/Blocks/00/EmptyBlock_03.tres",
	Block_01 = "res://Static/Resources/Objects/Blocks/00/Block_01.tres",
	Block_02 = "res://Static/Resources/Objects/Blocks/00/Block_02.tres",
	Block_03 = "res://Static/Resources/Objects/Blocks/00/Block_03.tres",
	Block_04 = "res://Static/Resources/Objects/Blocks/00/Block_04.tres",
	Block_05 = "res://Static/Resources/Objects/Blocks/00/Block_05.tres",
	Block_06 = "res://Static/Resources/Objects/Blocks/00/Block_06.tres",
	Block_07 = "res://Static/Resources/Objects/Blocks/00/Block_07.tres",
	EmptySlot_01 = "res://Static/Resources/Objects/Blocks/00/EmptySlot_01.tres",
	Slot_01 = "res://Static/Resources/Objects/Blocks/00/Slot_01.tres",
	Slot_02 = "res://Static/Resources/Objects/Blocks/00/Slot_02.tres",
	Slot_03 = "res://Static/Resources/Objects/Blocks/00/Slot_03.tres",
	EmptyHolder_01 = "res://Static/Resources/Objects/Blocks/00/EmptyHolder_01.tres",
	Holder_01 = "res://Static/Resources/Objects/Blocks/00/Holder_01.tres",
	Holder_02 = "res://Static/Resources/Objects/Blocks/00/Holder_02.tres",
	Holder_03 = "res://Static/Resources/Objects/Blocks/00/Holder_03.tres",
}

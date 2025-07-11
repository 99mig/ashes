extends Node

"""
MAIN
"""
const MAIN_STATE_MACHINE : String = "res://Managers/StateMachine/MainStateMachine.tscn"

enum MAIN_STATES {
	Start,
	Playmat
}

"""
MAP
"""
enum MAP_COMPONENT {
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

const SlotComponentScene : String = "res://Components/Map/Components/Slots/Slot.tscn"



"""
OBJECT
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

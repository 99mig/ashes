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
	
}

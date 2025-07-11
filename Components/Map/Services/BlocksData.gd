extends Node

static func _get_block_data(block: String) :
	return GlobalData.BLOCKS_INDEX[block]

static func _load_block_data(block: String) -> Resource:
	return load(GlobalData.BLOCKS_INDEX[block])
	

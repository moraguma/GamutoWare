extends Node2D

var value
var suit

var val_order = ["4", "5", "6", "7", "Q", "J", "K", "A", "2", "3"]
var suit_order = ["O", "E", "C", "P"]

func _init(v='2', s='O'):
	value = v
	suit = s
	
func cmp(other, vMan):
	if value == other.value:
		if value == vMan:
			return suit_order.find(suit) - suit_order.find(other.suit)
	
	if value == vMan:
		return 1
	
	if other.value == vMan:
		return -1
			
	return val_order.find(value) - val_order.find(other.value)

extends Node

onready var host = $".."
func play(name: String):
	if Input.get_connected_joypads().size() > 0 :
		var node = get_node(name)
		print("haptic play haptic:" ,name)
		var prefix = host.input_buffer.action_prefix
		assert(node != null, "No haptic with name " + name)
		var index = 0
		if (prefix.begins_with("player2")):
			index = 1
		node.playHaptic(index)

func playPickup(name: String):
	if Input.get_connected_joypads().size() > 0 :
		var node = get_node(name)
		print("haptic play haptic:" ,name)
		var prefix = host.get_parent().get_parent().input_buffer.action_prefix
		assert(node != null, "No haptic with name " + name)
		var index = 0
		if (prefix.begins_with("player2")):
			 index = 1
		node.playHaptic(index)
		

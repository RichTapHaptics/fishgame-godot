tool
extends EditorPlugin
var inport_plugin
func _enter_tree():
	# Initialization of the plugin goes here.
	add_autoload_singleton("RichtapSdk","res://addons/richtap_haptic/RichtapSdk.gd")
	add_custom_type("RichtapPlayer","Node",
		load("res://addons/richtap_haptic/RichtapPlayer.gd"),null)
	inport_plugin = preload("res://addons/richtap_haptic/HeZEditorImportPlugin.gd").new()
	add_import_plugin(inport_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("RichtapPlayer")
	remove_autoload_singleton("RichtapSdk")
	remove_import_plugin(inport_plugin)
	inport_plugin = null


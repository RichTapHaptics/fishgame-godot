tool
extends EditorImportPlugin

class_name HeEditorImportPlugin
enum Presets {DEFAULT}
const RESOURCE_TYPE = "TextFile"


func get_importer_name():
	return "He"
	
func get_recognized_extensions():
	return ["he"]
	
func get_save_extension():
	return "tres"
	#
func get_resource_type():
	print("EditorImportPlugin get_resource_type")
	return RESOURCE_TYPE
func get_import_options(preset):
	print("EditorImportPlugin load preset_index：", preset)
	match preset:
		Presets.DEFAULT:
			return [ {
					   "name": "use_red_anyway",
					   "default_value": false
					}]
		_:
			return []
#
func get_visible_name():
	return "Resource"
	#
func get_option_visibility(option, options):
	return false
func get_preset_count():
	return Presets.size()
func get_preset_name(preset_index):
	match preset_index:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"
		
func get_priority():
	return 1
func get_import_order():
	return 0
	
func import(source_file, save_path, options, platform_variants, gen_files):
	print("EditorImportPlugin import save_path：" + save_path + "，source_file:", source_file)
	var resource = HeResource.new()
	print("EditorImportPlugin resource", resource)
	var saveName = "%s.%s" % [save_path, get_save_extension()]
	resource.load_forn_file(source_file, saveName)
	var e = ResourceSaver.save(saveName, resource, ResourceSaver.FLAG_CHANGE_PATH)
	gen_files.push_back(saveName)
	print("EditorImportPlugin save result：", e, saveName)
	return e

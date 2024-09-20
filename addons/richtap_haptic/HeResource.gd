tool
extends TextFile

class_name HeResource
export var _heContent: String setget _set_he_content

func getHeContent():
	return _heContent

func _set_he_content(value: String) -> void:
	_heContent = value
	pass

func _ready():
	pass # Replace with function body.

func load_forn_file(p_path, saveName):
	print("HeResource load_forn_file: p_path" + p_path)
	resource_name = get_file_name(p_path)
	resource_path = saveName
	read_file_content(p_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_file_name(file_path: String):
	var file_name = file_path.get_file()
	return file_name

func read_file_content(file_path: String):
	var file = File.new()
	var error = file.open(file_path, File.READ)
	if error != OK:
		push_error("Unable to open file：" + file_path + str(error))
		return ""
	_heContent = file.get_as_text()
	file.close()
	
func get_property_list() -> Array:
	var properties = []
	return properties

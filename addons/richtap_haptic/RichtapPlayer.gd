tool
extends Node

export(TextFile) var source_clip = null setget set_source_clip
export(bool) var Playing = false setget set_playing
export(int, -1, 100) var Loop = 0
export(int, 0, 511) var Amplitude = 254
export(int, -100, 100) var Frequency = 0
export(bool) var mute = false setget set_mute
var testContent:String = ""
func playHaptic(count = 1,index = 0):
	print("RichtapPlayer playHaptic")
	if(source_clip != null) :
		RichtapSdk.setTargetControllers(count,[index])
		RichtapSdk.playHaptic(testContent,Loop,Amplitude,Frequency)

func set_source_clip(value) :
	if(value != null) :
		print("HeResource set_source_clip",value.resource_path)
		testContent = getFileContent(value.resource_path)
	source_clip = value

func stopHaptic():
	RichtapSdk.stopHaptic()

func getSdkVersion():
	return RichtapSdk.getVersionName()

func sendLoopParamters( intensity:int = 0, frequency:int = 0, interval:int = 0):
		RichtapSdk.sendLoopParameters(intensity,frequency,interval)

func set_playing(value: bool) -> void:
	if Playing != value:
		if value :
			playHaptic()
		Playing = value

func set_mute(value: bool) -> void:
	if mute != value:
		if (value) :
			sendLoopParamters(0,0,0)
		else :
			sendLoopParamters(Amplitude,Frequency,0)
		mute = value

func openLog(enable:bool) :
	RichtapSdk.openLog(enable)
	
func _enter_tree():
	print("RichtapPlayer _enter_tree")

func getFileContent(resource_path) -> String:
	print("HeResource resource_path：" + resource_path)
	var newPath = resource_path + ".import"
	#print("HeResource resource_path：" + newPath)
	var tagerPath = read_file_content(newPath)
	var resource = ResourceLoader.load(tagerPath) as HeResource
	if resource:
		#print(resource.getHeContent())
		return resource.getHeContent()
	else:
		return ""	

func read_file_content(file_path:String)->String:
	var file = File.new()
	var error = file.open(file_path, File.READ)
	if error != OK:
		push_error("Unable to open file：" + file_path + str(error))
		return ""

	## 读取文件内容
	var heContent = file.get_as_text()
	file.close()
	#print("he读取内容:成功 +===" + heContent)
	var lines = heContent.split('\n')
	for line in lines:
		line = line.strip_edges()  # 去除行首尾空白字符
		if line.begins_with("path="):
			return line.substr(6,line.length() -7)  # 提取 path 后面的内容
	return ""

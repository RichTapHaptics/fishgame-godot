tool
extends Node
onready var richtapPlay = preload("res://addons/richtap_haptic/bin/richtapplay.gdns").new()
func playHaptic(heContent:String ,loop = 0,amplitude = 255,frequency = 0) :
	#print("RichtapSdk playHaptic heContent",heContent)
	print("RichtapSdk playHaptic amplitude",amplitude)
	getSdkVersion()
	richtapPlay.play(heContent,loop, 0, amplitude, frequency)

func setTargetControllers(count = 1 ,index = [0]) :
	print("RichtapSdk playHaptic setTargetControllers",count,"index:",index)
	richtapPlay.setTargetControllers(count,index)

func stopHaptic():
	print("RichtapSdk stopHaptic")
	richtapPlay.stop()

func _enter_tree():
	print("RichtapSdk SdkVersion:", getSdkVersion())
	print("RichtapSdk ConnectedGameControllers:",richtapPlay.getConnectedGameControllers())
	
func getSdkVersion():
	return richtapPlay.getVersionName()

func openLog(enable):
	richtapPlay.enableLog(enable,0)
	
func sendLoopParameters(intensity:int = 0, frequency:int = 0, interval:int = 0):
		print("RichtapSdk sendLoopParameters intensity",intensity)
		richtapPlay.sendLoopParameters(intensity,frequency,interval)
		
func _init():
	print("RichtapSdk _init")
	if (richtapPlay == null) :
		print("RichtapSdk playHaptic richtapPlay",richtapPlay)
		richtapPlay = preload("res://addons/richtap_haptic/bin/richtapplay.gdns").new()
		richtapPlay.initialize()
		openLog(true)
	
func _exit_tree():
	print("RichtapSdk _exit_tree")
	richtapPlay.release()
	richtapPlay = null


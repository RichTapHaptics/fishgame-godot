extends CPUParticles2D

onready var sounds = $Sounds
onready var haptic = $Haptic
var index = 0

func _ready():
	emitting = true
	sounds.play("Explode")
	if Input.get_connected_joypads().size() > 0 :
		haptic.playHaptic(1,index)

func _on_Timer_timeout() -> void:
	queue_free()

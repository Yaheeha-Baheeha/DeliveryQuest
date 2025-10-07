extends MeshInstance3D

var hidemae = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hidemae == true:
		self.hide

signal bossstarted

func _on_bossroom_1_teleporter_body_entered(body: Node3D) -> void:
	CogitoGlobals.counter+=1
	self.hide()
	hidemae = true
	print("hid myself. Counter = ", CogitoGlobals.counter)
	if CogitoGlobals.counter >= 3:
		emit_signal("bossstarted")
		print("boss")

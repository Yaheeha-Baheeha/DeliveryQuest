extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal bossstarted
var counter = 0
func _on_bossroom_1_teleporter_body_entered(body: Node3D) -> void:
	counter+=1
	self.hide()
	print("hid myself")
	if counter == 3:
		counter = 0
		emit_signal("bossstarted")

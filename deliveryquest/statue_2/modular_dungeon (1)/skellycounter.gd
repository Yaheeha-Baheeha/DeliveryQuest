extends Node3D

var counterskelly = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counterskelly = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skeletonb_tree_exited() -> void:
	counterskelly+=1
	if counterskelly == 4:
		self.queue_free()

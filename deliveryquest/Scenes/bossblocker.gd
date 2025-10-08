extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape3D.disabled = false
	print("bossBlocked")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if CogitoGlobals.counter >= 3:
		$CollisionShape3D.disabled = true
		print("bossStarted")




func allow_boss():
	$CollisionShape3D.disabled = true
	print("bossStarted")

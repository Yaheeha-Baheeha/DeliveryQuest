extends Node3D

signal damage_received(damage_value:float)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var rng = RandomNumberGenerator.new()
var shotsfired = 0
var sliced = 0
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	rng.randomize()
	var rand_int = rng.randi_range(0, 2)
	match anim_name:
		"2H_Melee_Attack_Slice":
			if sliced == 1:
				$AnimationPlayer.play("Idle")
				sliced=0
			else:
				$AnimationPlayer.play_backwards("2H_Melee_Attack_Slice")
				sliced=1
		"Idle":
			if rand_int==0:
				$AnimationPlayer.play("Idle")
			elif rand_int ==2:
				$AnimationPlayer.play("2H_Melee_Attack_Slice")
			else:
				$AnimationPlayer.play("2H_Ranged_Aiming")
		"2H_Ranged_Aiming":
			$AnimationPlayer.play("2H_Ranged_Shooting")
		"2H_Ranged_Aiming_2":
			$AnimationPlayer.play("Idle")
		"2H_Ranged_Shooting":
			if shotsfired >=5:
				shotsfired = 0
				$AnimationPlayer.play_backwards("2H_Ranged_Aiming_2")
			else:
				shotsfired+=1
				$AnimationPlayer.play("2H_Ranged_Shooting")

extends Node2D

func _on_DeathArea_body_entered(body):
	$Player.position = $Spawn.position

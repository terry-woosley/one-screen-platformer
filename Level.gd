extends Node2D

var gem_flag = false
var key_flag = false
var key_door_has_played = false

func _ready():
	$KeyDoor.position = Vector2(55, 88)

func _process(delta):
	if Input.is_action_pressed("skip_level"):
		print("Level Skipped")
		gem_flag = true
		key_flag = true
		$Player.position = $LevelSkip.position
	
	if gem_flag == true and key_flag == true and key_door_has_played == false:
		key_door_has_played = true
		$KeyDoor/AnimationPlayer.play("OpenWithKey")

func _on_DeathArea_body_entered(body):
	$Player.position = $Spawn.position

func _on_Gem_body_entered(body):
	$Gem.hide()
	gem_flag = true
	print("You've got the gem!")

func _on_Key_body_entered(body):
	$Key.hide()
	key_flag = true
	print("You've got the key!")

func _on_ExitDoor_body_entered(body):
	if gem_flag == true and key_flag == true:
		$Player.hide()
		print("You've escaped with the goods!")
	else:
		print("You need the gem and the key!")

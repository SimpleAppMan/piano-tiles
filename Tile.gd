extends Node2D


var isBlackTile = false

func _ready():
	pass


func setIsBlackTile(tof):
	isBlackTile = tof
	refreshColour()


func refreshColour():
	if isBlackTile:
		$ColorRect.color = Color(0, 0, 0, 1)
	else:
		$ColorRect.color = Color(1, 1, 1, 1)


func _on_ColorRect_gui_input(event : InputEvent):
	if Input.is_action_just_pressed("ui_click"):
		if isBlackTile:
			setIsBlackTile(false)
		else:
			get_parent().lose()

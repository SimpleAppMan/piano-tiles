extends Node2D


var speed = 500

onready var tileGrid = $TileGrid

func _ready():
	pass # Replace with function body.


func _process(delta):
	slide_grid(speed*delta)


func slide_grid(finalSpeed):
	tileGrid.move(finalSpeed)

func step_grid():
	pass


func _on_Area2D_area_exited(area):
	tileGrid.rowExited(area)

extends Node2D


const tileClass = preload("res://Tile.tscn")

var rng = RandomNumberGenerator.new()

var tileRowList = Array()


func _ready():
	rng.randomize()
	for i in range(5):
		addRow(874 - 300*i)


func move(speed):
	for row in tileRowList:
		for tile in row:
			tile.position.y += speed


func rowExited(area):
	var firstTile = false
	var blackTileLeft = false
	
	for row in tileRowList:
		if row.has(area):
			firstTile = true
			for tile in row:
				if tile.isBlackTile:
					blackTileLeft = true
				tile.queue_free()
			tileRowList.erase(row)
	
	if blackTileLeft:
		lose()
	
	if firstTile:
		addRow(tileRowList.back()[0].position.y - 300)


#func tile_gui_input(viewport : Node, event : InputEvent, shape_idx : int, tile):
#	print("kek")
#	if event is InputEventMouseButton:
#		if event.button_index == BUTTON_LEFT && event.pressed:
#			tile.click()


func lose():
	print("you lose")


func addRow(yVal):
	var blackTile = rng.randi_range(0, 3)
	var newTileRow = Array()
	
	for i in range(4):
		var tile = tileClass.instance()
		tile.position = Vector2(75 + 150*i, yVal)
		if i == blackTile:
			tile.setIsBlackTile(true)
		newTileRow.append(tile)
		#tile.connect("input_event", self, "tile_gui_input", [tile])
		add_child(tile)
	
	tileRowList.append(newTileRow)

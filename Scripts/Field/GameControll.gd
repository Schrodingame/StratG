extends Node2D
var rng = RandomNumberGenerator.new()
var cellsArray = []
var result
var actCell
var money=15000
func _ready():
	for child in $Markers.get_children():
		if child is Marker2D:
			cellsArray.append(child)
	##cellsArray.sort()
	print(cellsArray)
	actCell=0
	$PlayerBody.moveToCell(cellsArray[0].global_position)
	$Money.text=str(money)
func _on_button_pressed(): #Наработки Никиты Г. в мультимедиа.
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")	
	#$Label.text = "meow"
	$Button.text = "Никита"
	$Button.icon = preload("res://Media/milye-zveriushki.-4-1.webp")
	pass 

func _on_dice_drop_pressed():
	var dice_1 = rng.randi_range(1,6)
	var dice_2 = rng.randi_range(1,6)
	result = dice_1+dice_2
	if (actCell+result)>40:
		actCell=(actCell+result)-40
		money+=2000
	else : actCell+=result
	if (actCell==5||actCell==15||actCell==25||actCell==35) :
		OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
	$Dice_1.text=str(dice_1)
	$Dice_2.text=str(dice_2)
	print ("Result = ",result)
	print("ActCell = ",actCell)
	$PlayerBody.moveToCell(cellsArray[actCell].global_position)	
	$Money.text=str(money)
	

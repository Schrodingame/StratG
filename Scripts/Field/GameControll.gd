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
	#Вариант автоматической расстановки маркеров
	"""for i in range(39):
		if i==0:
			cellsArray[i].global_position = Vector2i(60,60)
		elif i==10:
			cellsArray[i].global_position = Vector2i(60,60)
		elif i==20:
			cellsArray[i].global_position = Vector2i(60,60)
		elif i==30:
			cellsArray[i].global_position = Vector2i(60,60)
		
		cellsArray[i].global_position = Vector2i(0,0)"""
	actCell=0
	$"Player#1".moveToCell(cellsArray[0].global_position)
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
		#OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
		# Sorry, it bothers me...
		pass
	$Dice_1.text=str(dice_1)
	if dice_1==1: 
		$Dice_1_visual/Side1Pip.set_visible(true)
	else:
		$Dice_1_visual/Side1Pip.set_visible(false)
	if dice_1==2: 
		$Dice_1_visual/Side2Pips.set_visible(true)
	else:
		$Dice_1_visual/Side2Pips.set_visible(false)
	if dice_1==3: 
		$Dice_1_visual/Side3Pips.set_visible(true)
	else:
		$Dice_1_visual/Side3Pips.set_visible(false)
	if dice_1==4: 
		$Dice_1_visual/Side4Pips.set_visible(true)
	else:
		$Dice_1_visual/Side4Pips.set_visible(false)
	if dice_1==5: 
		$Dice_1_visual/Side5Pips.set_visible(true)
	else:
		$Dice_1_visual/Side5Pips.set_visible(false)
	if dice_1==6: 
		$Dice_1_visual/Side6Pips.set_visible(true)
	else:
		$Dice_1_visual/Side6Pips.set_visible(false)
	
	if dice_2==1: 
		$Dice_2_visual/Side1Pip.set_visible(true)
	else:
		$Dice_2_visual/Side1Pip.set_visible(false)
	if dice_2==2: 
		$Dice_2_visual/Side2Pips.set_visible(true)
	else:
		$Dice_2_visual/Side2Pips.set_visible(false)
	if dice_2==3: 
		$Dice_2_visual/Side3Pips.set_visible(true)
	else:
		$Dice_2_visual/Side3Pips.set_visible(false)
	if dice_2==4: 
		$Dice_2_visual/Side4Pips.set_visible(true)
	else:
		$Dice_2_visual/Side4Pips.set_visible(false)
	if dice_2==5: 
		$Dice_2_visual/Side5Pips.set_visible(true)
	else:
		$Dice_2_visual/Side5Pips.set_visible(false)
	if dice_2==6: 
		$Dice_2_visual/Side6Pips.set_visible(true)
	else:
		$Dice_2_visual/Side6Pips.set_visible(false)
	
	$Dice_2.text=str(dice_2)
	print ("Result = ",result)
	print("ActCell = ",actCell)
	$"Player#1".moveToCell(cellsArray[actCell].global_position)	
	$Money.text=str(money)
	

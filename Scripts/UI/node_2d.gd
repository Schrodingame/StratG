extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(test_inc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(str(delta))
	pass

var button:String
var test_inc:int = 228

func inc():
	test_inc += 1
	pass


func _on_button_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
	inc()
	print(test_inc)
	$Label.text = "meow"
	$Button.text = "Никита"
	$Button.icon = preload("res://Media/milye-zveriushki.-4-1.webp")
	pass # Replace with function body.

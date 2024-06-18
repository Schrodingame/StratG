extends Window

var cellPrice:int 
@onready var BuyPopUp = $"."
@onready var _labelText = $VBoxContainer/Price
signal  choused;
var buy:bool=false

func _on_to_buy_button_up(): #Купить	
	
	buy=true
	BuyPopUp.hide()
	emit_signal("choused")
	pass # Replace with function body.


func _on_button_button_up(): #На аукцион
	
	BuyPopUp.hide()
	buy = false
	emit_signal("choused")
	pass # Replace with function body.
	

func _on_visibility_changed():
	#_labelText.text="900"
	
	pass # Replace with function body.


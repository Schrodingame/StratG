extends Window


@onready var _eventText =$VBoxContainer/EventText

@onready var EventPopUp = $"."
signal accepted

func _ready():
	pass # Replace with function body.




func _on_accept_button_up():
	
	EventPopUp.hide()
	emit_signal("accepted")
	pass # Replace with function body.

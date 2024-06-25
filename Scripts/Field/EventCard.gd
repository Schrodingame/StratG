class_name EventCard
extends CellCard;

## Название карты события.
@export var card_name: String = "?":
	set( val ): emit_signal( "dirtycard" ); card_name = val;
## Рисунок на карте. Любая текстура (в т. ч. анимированная).
@export var card_picture: Texture2D:
	set( val ): emit_signal( "dirtycard" ); card_picture = val;

@export_group( "Дополнительно" )
## Цвет фоновой подложки.
@export var background_color: Color = "#0000005f":
	set( val ): emit_signal( "dirtycard" ); background_color = val;


@onready var _cname = $VBoxContainer/EventName;
@onready var _cpicture = $VBoxContainer/AspectRatioContainer/Picture;
@onready var _cbackground = $Background;


func _on_card_update():
	_cname.text = card_name;
	_cpicture.texture = card_picture;
	_cbackground.color = background_color;
	
@onready var encounter =  [["Вы попали на тестовую клетку и теперь должны отдать создателям игры свою печень, и заплатить 4000 ",-4000,null],
							["Вам сегодня везёт, можете потратить эти 3000 на еду",3000,19],
							["Тут могла быть ваша рекламма",0,39]]
func _messageText(number:int):
	return encounter[number]

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


func on_player_enter( cur_player_index: int ):
	var player: MonopolyPlayer = Global.players[ cur_player_index ];
	var eventwindow: Node = $"/root/Game/EventWindow";

	var randomCardData = encounter[(randi_range(0,encounter.size()-1 ))]

	eventwindow.show()
	eventwindow._eventText.text = str(randomCardData[0])  #Взять текст события
	player.money+=randomCardData[1]
	if randomCardData.size() > 2 && randomCardData[2]!=null:			
		player.curcard = Global.cells[randomCardData[2]-1]
		player.yourTern(1)

	await eventwindow.accepted


func _on_card_update():
	_cname.text = card_name;
	_cpicture.texture = card_picture;
	_cbackground.color = background_color;
	
@onready var encounter =  [["Вы попали на тестовую клетку и теперь должны отдать создателям игры свою печень, и заплатить 4000 ",-4000,null],
							["Вам сегодня везёт, можете потратить эти 3000 на еду",3000,null],
							["Тут могла быть ваша рекламма",0,null],
							["Великий вождь решил освободить соседей,занесите в казну 10000",10000,null],
							["Цена на нефть резко поднялась, вы молодец и можете получить свои 120 рублей в кассе",120,null],
							["Астрологи объявили неделю упавшего мыла, переместитесь в тюрьму",0,10]]
func _messageText(number:int):
	return encounter[number]

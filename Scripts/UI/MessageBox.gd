extends RichTextLabel;

var messages: Array[String];

func reset_text():
	text = ""

	for m in messages:
		text += m + "\n";

#func _ready():
#	print( get_class() + " READY" )


func add_message( msg: String, playernum: int = -1 ):
	var addmsg: String;

	if ( playernum == -1 ):
		# System message.
		addmsg = msg;
	else:
		# Player-related message.
		addmsg = "[color=Darkgreen][b]Игрок %d[/b][/color] %s" % [ playernum, msg ];

	messages.push_back( addmsg )
	text += addmsg + "\n";
	#print( get_class() + " msg '" + msg + "'" )


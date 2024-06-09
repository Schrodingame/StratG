extends Node2D

const const_DotSpriteNames = [
	"Side1Pip",
	"Side2Pips",
	"Side3Pips",
	"Side4Pips",
	"Side5Pips",
	"Side6Pips"
]

var curside: Node;

func roll() -> int:
	var rolledval: int = randi_range( 1, 6 );
	update_value( rolledval );
	return rolledval;


func update_value( val: int ) -> void:
	var side: Node;
	
	if ( val > 0 && val < const_DotSpriteNames.size() + 1 ):
		side = find_child( const_DotSpriteNames[ val - 1 ] )
	
	if ( !side ):
		push_warning( "Dice_d6::update_value(). No child Node for side " + str( val ) );
		return	

	if ( curside ):
		curside.visible = false;
	side.visible = true;
	$DiceLabel.text = str( val );

	curside = side;

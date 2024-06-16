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
@onready var initialpos: Vector2 = global_position;

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

	# Visualization (side and text):
	if ( curside ):
		curside.visible = false;
	side.visible = true;

	$DiceLabel.text = str( val );

	# A simple animation:
	global_position = initialpos;
	var rndjump: Vector2 = Vector2( 0.0, randf_range( -23.0, -15.0 ) );
	var tw = $DiceLabel.create_tween();
	tw.tween_property( self, "global_position", global_position + rndjump, 0.025 )
	tw.chain().tween_property( self, "global_position", global_position, 0.1 ).set_ease( Tween.EASE_IN )

	curside = side;

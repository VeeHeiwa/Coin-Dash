extends Node

export (PackedScene) var Coin
export (int) var playtime

var level
var score
var time_left
var screensize 
var playing = false


func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	
	# Initialize the screen size variable
	$ThePlayer.setScreenSize(screensize)
	
	# set the player position
	# $ThePlayer.start()

	# $ThePlayer.hide()
	
	new_game()

func new_game():
	playing = true
	level = 1
	score = 0
	time_left = playtime
	$ThePlayer.start()

	$GameTimer.start()
	spawn_coins()
	
# Spawning coins based on the level
func spawn_coins():
	for i in range(4+level):
		var c = Coin.instance()
		$CoinContainer.add_child(c)
		c.position = Vector2(rand_range(0,screensize.x),rand_range(0,screensize.y))
	
	
	
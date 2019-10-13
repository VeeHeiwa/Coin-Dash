extends Node

export (PackedScene) var Coin
export (int) var playtime

var level
var score
var time_left
var screensize 
var playing = false

signal start_game


func _ready():
	
	randomize()
	screensize = get_viewport().get_visible_rect().size
	
	# Initialize the screen size variable
	$ThePlayer.setScreenSize(screensize)
	

func game_over():
	pass
	
func new_game():
	playing = true
	level = 1
	time_left = 15
	
	for coin in $CoinContainer.get_children():
		coin.queue_free()
	
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


func _on_MessageTimer_timeout():
#	 code to hide message
	pass

func _on_Main_start_game():
	print('signal received')
	new_game()

func _on_GameTimer_timeout():
	time_left -= 1
	$hud.updateTime(time_left)
	
	if time_left < 0:
		game_over()

func update_score():
	score += 1
	$hud.updateScore(score)
	

extends Node
# the players path that the radio op is tracking
var player_path = []

signal finished

var map = [['O','O','O','O','O','O','O','O','O','O','O','O','O','O','O'],
['O','O','X','O','O','O','X','O','O','O','O','O','X','X','O'],
['O','O','X','O','O','O','O','O','X','O','O','O','X','O','O'],
['O','O','O','O','O','O','O','O','X','O','O','O','O','O','O'],
['O','O','O','O','O','O','O','O','O','O','O','O','O','O','O'],
['O','O','O','O','O','O','O','O','O','O','O','O','O','O','O'],
['O','X','O','X','O','O','X','O','X','O','O','O','O','O','O'],
['O','X','O','X','O','O','X','O','O','O','O','O','O','O','O'],
['O','O','O','X','O','O','O','X','O','O','O','X','X','X','O'],
['O','O','O','O','O','O','O','O','O','O','O','O','O','O','O'],
['O','O','O','X','O','O','O','O','O','O','O','O','O','O','O'],
['O','O','X','O','O','O','O','X','O','O','O','X','O','O','O'],
['X','O','O','O','O','O','O','O','O','O','O','O','X','O','O'],
['O','O','X','O','O','O','X','O','X','O','O','O','O','X','O'],
['O','O','O','X','O','O','O','O','O','O','O','O','O','O','O']]

#keeps track of all the spots the player could be
var open_spots = []

#where the player could be, this is a return variable
var player_possible_spots = []

var current_index = 0

var new_possible_spots = []

var player_exact_location
var exact_location_known = false
# Called when the node enters the scene tree for the first time.
func _ready():
	create_open_spots() 

func create_open_spots():
	for i in range(0,15):
		for j in range(0,15):
			if map[i][j] != "X":
				open_spots.append(Vector2(i,j))

func on_west():
	#when the west button is pressed, change the player path, and 
	player_path.append("west")
	test_current_spots()
	print(player_path)

func on_east():
	player_path.append("east")
	test_current_spots()
	print(player_path)

func on_north():
	player_path.append("north")
	test_current_spots()
	print(player_path)

func on_south():
	player_path.append("south")
	test_current_spots()
	print(player_path)

func is_spot_valid(current_spot):
	
	var map_double = duplicate(map)
	for direction in player_path:
		
		#increment the spot to the new spot
		if direction == "north":
			current_spot.y -= 1
		elif direction == "east":
			current_spot.x += 1
		elif direction == "south":
			current_spot.y += 1
		elif direction == "west":
			current_spot.x -= 1
		else:
			return FAILED
		
		if is_off_map(current_spot):
			return false
		
		#if the sub runs into a island, return a false
		if map_double[current_spot.x][current_spot.y] == "X" or map_double[current_spot.x][current_spot.y] == "x":
			return false
		else:
			map_double[current_spot.x][current_spot.y] = "x"
	
	map_double.queue_free()
	#if the sub is able to make it through the entire map without crashing, return true
	return true

func is_off_map(new_spot):
	if  new_spot.x > 14 or new_spot.x < 0 or new_spot.y > 14 or new_spot.y < 0:
		return true
	return false

func test_start_spots(difficulty):
	#this is for testing the start spots, currently it's not being used, but it could have use later
	#Every time this function is called, will go a certain number of times. Harder bots will search more
	for i in range(0, difficulty):
		
		var current_guess = player_possible_spots[current_index]
		if is_spot_valid(current_guess):
			new_possible_spots.append(current_guess)
		
		current_index += 1

func test_current_spots():
	#reset the player possible spots array
	player_possible_spots = [] 
	#runs through all the spots on the map, the player could have moved back there, we can't get rid of them
	for spot in open_spots:
		if is_spot_valid_backwards(spot):
			player_possible_spots.append(spot)
	
	#if the length of the player possible spots list is 0, something messed up, restart the player path
	if player_possible_spots.size() == 0:
		player_path = []
	#tell the map to update the circles on the map
	emit_signal("finished")

func is_spot_valid_backwards(current_spot):
	#similar to function up top, but this is to find the current spot, and to do this it must go backwards
	var map_double = map.duplicate(true)
	var reverse_path = player_path.duplicate(true)
	reverse_path.invert()
	for direction in reverse_path:
		
		#increment the spot to the new spot
		if direction == "north":
			current_spot.x += 1
		elif direction == "east":
			current_spot.y -= 1
		elif direction == "south":
			current_spot.x -= 1
		elif direction == "west":
			current_spot.y += 1
		else:
			return FAILED
		
		if is_off_map(current_spot):
			return false
		
		#if the sub runs into a island, return a false
		if map_double[current_spot.x][current_spot.y] == "X" or map_double[current_spot.x][current_spot.y] == "x":
			return false
		else:
			map_double[current_spot.x][current_spot.y] = "x"
	
	#if the sub is able to make it through the entire map without crashing, return true
	return true

func get_player_possible_positions():
	return player_possible_spots
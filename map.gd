extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func draw_circle_arc(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = PoolVector2Array()

    for i in range(nb_points + 1):
        var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

    for index_point in range(nb_points):
        draw_line(points_arc[index_point], points_arc[index_point + 1], color, 2)

func draw_all_circles():
	
	#to convert the position to a letter for getting the node
	var letter_dict = {0:"A", 1:"B", 2:"C", 3:"D", 4:"E", 5:"F", 6:"G", 7:"H", 8:"I",
	9:"J", 10:"K", 11:"L", 12:"M", 13:"N", 14:"O"}
	
	#clear the board
	for i in range(1,16):
		for j in range(0,15):
			var node_string = str(str(i) + letter_dict[int(j)])
			if has_node(node_string):
				get_node(node_string).visible = false

	#getting the player positions from the radio_op node
	var circle_positions = get_node("/root/game/radio_op").get_player_possible_positions()
	for position in circle_positions:
		var x_num = str(position.x + 1) 
		var node_string = str(x_num + letter_dict[int(position.y)])
		
		get_node(node_string).visible = true


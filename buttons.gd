extends Control

signal north
signal south
signal east
signal west
signal stop

func _on_east_button_pressed():
	$north.disabled = false
	$south.disabled = false
	$west.disabled = true
	emit_signal("east") # Replace with function body.

func _on_west_button_pressed():
	$north.disabled = false
	$south.disabled = false
	$east.disabled = true
	emit_signal("west")

func _on_south_button_pressed():
	$east.disabled = false
	$west.disabled = false
	$north.disabled = true
	emit_signal("south")

func _on_stop_button_pressed():
	emit_signal("stop")


func _on_north_pressed():
	$east.disabled = false
	$west.disabled = false
	$south.disabled = true
	emit_signal("north")
	print("Success")

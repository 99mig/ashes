class_name MouseInput


func _input(event) -> void:
	print(event)
	if event == InputEventMouseButton:
		print("click")
	
		if Input.is_action_pressed("MouseLeftClick"):
				print("Left click")
		elif event.is_action_pressed("MouseRightClick"):
			print("Rightclick")

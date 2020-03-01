extends KinematicBody2D

const VELOCITY = 200
const GRAVITY = 20
const JUMP_FORCE = -500

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VELOCITY
		$Sprite.play("run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VELOCITY
		$Sprite.play("run")
		$Sprite.flip_h = true
	else:
		motion.x = 0;
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			$Sprite.play("jump")	
			motion.y = JUMP_FORCE
		elif Input.is_action_pressed("ui_down"):
			$Sprite.play("slide")			
		
	motion = move_and_slide(motion, Vector2(0, -1))

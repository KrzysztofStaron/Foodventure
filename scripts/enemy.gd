extends KinematicBody2D
class_name enemy

var health = 0
var maxHelth = 100
var armorlevel = 0

func _ready():
	health = maxHelth

func die():
	print("Die")
	pass

func hurt(dmg):
	if dmg >= armorlevel:
		health -= dmg-armorlevel
		
	print("Hurt")
	pass

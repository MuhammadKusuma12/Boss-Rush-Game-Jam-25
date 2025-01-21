extends Node
class_name BossBehaviourMan

@export var initBehaviour : Behaviour
var currentBehaviour : Behaviour
var behaviours := {} as Dictionary

func _ready():
	for child in get_children():
		if child is Behaviour:
			behaviours[child.name.to_lower()] = child
			child.ChangeBehaviour.connect(_on_change_behaviour)
	if initBehaviour:
		currentBehaviour = initBehaviour
		currentBehaviour.Enter()

func _process(delta):
	if currentBehaviour:
		currentBehaviour.Update(delta)

func _physics_process(delta):
	if currentBehaviour:
		currentBehaviour.Update_Physics(delta)

func _on_change_behaviour(behaviour : Behaviour, newBehaviourKey : String):
	if (behaviour != currentBehaviour):
		print("Debug: behaviour must be equal to currentBehaviour in order to switch")
		print("The behaviour in the param is "+behaviour.name+"\n"+"While the currentBehaviour is "+currentBehaviour.name)
	
	var newBehaviour = behaviours[newBehaviourKey.to_lower()] as Behaviour
	if !newBehaviour:
		print("Debug: behaviour "+newBehaviourKey+" does not exist")
		return
	
	if currentBehaviour:
		currentBehaviour.Exit()
	newBehaviour.Enter()
	currentBehaviour = newBehaviour

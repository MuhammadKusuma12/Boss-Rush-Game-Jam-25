extends Behaviour

@export var boss_nav : BossNav

func Enter():
	print("Being docile for 5 seconds")
	boss_nav.nav_enabled = false
	$Duration.start(5)

func _on_duration_timeout() -> void:
	ChangeBehaviour.emit(self, "Move")

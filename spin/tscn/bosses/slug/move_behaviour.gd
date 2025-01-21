extends Behaviour

@export var boss_nav : BossNav

func Enter():
	boss_nav.nav_enabled = true
	print("Moving for 3 second")
	$Duration.start(5)

func _on_duration_timeout() -> void:
	ChangeBehaviour.emit(self, "Attack1")

func Exit():
	boss_nav.nav_enabled = false

extends NavigationAgent2D
class_name BossNav

@onready var boss = self.get_parent() as Boss
var nav_enabled := false

func _physics_process(delta: float) -> void:
	var dir = boss.to_local(get_next_path_position()).normalized()
	match nav_enabled:
		true: boss.velocity = dir * boss.SPEED
		false: boss.velocity *= 0

func _on_rate_timeout() -> void:
	target_position = boss.player.global_position

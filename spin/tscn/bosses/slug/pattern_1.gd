extends Behaviour

@export var slug : Boss
@export var boss_nav : BossNav
@onready var map = get_tree().get_nodes_in_group("map")
var shots_fired = 0

func Enter():
	print("Switched to attack")
	$Rate.start()

func _on_rate_timeout() -> void:
	shots_fired += 1
	if shots_fired >= 7:
		ChangeBehaviour.emit(self, "Docile")
	var shot = load("res://tscn/bosses/slug/raindrop.tscn").instantiate() as RainDrop 
	shot.position = Vector2(slug.player.position.x, slug.player.position.y)
	map[0].add_child(shot)

func Exit():
	shots_fired = 0
	$Rate.stop()

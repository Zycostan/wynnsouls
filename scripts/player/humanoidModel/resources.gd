extends Node
class_name HumanoidResources

@export var god_mode : bool = false

@export var health : float = 100
@export var max_health : float = 100

@export var stamina : float = 100
@export var max_stamina : float = 100
@export var stamina_regeneration_rate : float = 10  ## per sec, because then we'll multiply on delta

@export var strength : int = 10

@onready var model = $".." as PlayerModel

var statuses : Array[String]
var effects : Array[StatusEffect] = []
const FATIQUE_TRESHOLD = 20

func update(delta : float):
	gain_stamina(stamina_regeneration_rate * delta)

func pay_resource_cost(move : Move):
	lose_stamina(move.stamina_cost)

func can_be_paid(move : Move) -> bool:
	if stamina > 0 or move.stamina_cost == 0:
		return true
	return false

func lose_health(amount : float):
	if not god_mode:
		health -= amount
		if health < 1:
			model.current_move.try_force_move("death")

func gain_health(amount : float):
	if health + amount <= max_health:
		health += amount
	else:
		health = max_health

func lose_stamina(amount : float):
	if not god_mode:
		stamina -= amount
		if stamina < 1:
			statuses.append("fatique")

func gain_stamina(amount : float):
	if stamina + amount <= max_stamina:
		stamina += amount
	else:
		stamina = max_stamina
	if stamina > FATIQUE_TRESHOLD:
		statuses.erase("fatique")

func add_effect(eff: StatusEffect):
	for e in effects:
		if e.effect_name == eff.effect_name:
			e.refresh() # reapply poison resets the timer instead of stacking that shits
			return
	var effect := eff.duplicate() as StatusEffect # timer per target
	effects.append(effect)
	statuses.append(effect.effect_name)
	effect.apply(self)

func tick_effects(delta: float):
	for e in effects.duplicate():
		if effects.has(e) and e.time(delta):
			remove_effect(e)

func remove_effect(ef: StatusEffect):
	if not effects.has(ef):
		return
	effects.erase(ef)
	statuses.erase(ef.effect_name)
	ef.remove()

func clear_effects():
	for e in effects.duplicate():
		remove_effect(e)

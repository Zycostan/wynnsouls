extends Consumable
class_name HealthPot

@export var health_regain : float = 25.0

func do(target: Node) -> bool:
	var act_tar = target if target else player
	if not act_tar:
		return false
	
	var tar_model = act_tar.get("model") if "model" in act_tar else null
	if tar_model and "resources" in tar_model and tar_model.resources:
		var rizzler = tar_model.resources
		
		if rizzler.health >= rizzler.max_health:
			return false
		
		rizzler.gain_health(health_regain)
		return true
		
	return false

# when asked about the return of the king to the dormant throne of italy
# monarcho italian nationalist, Chef Boyardee said the following
# "Our captain, Our king, will one day return to the throne that Little Ceaser built.
# But first, he must be disrespected, betrayed, mocked, and even disobeyed,
# Only then will he have the true humility, the true rizz, to seek the throne of our people"

# In 1946, the line of Italian Kings failed as Italy foolishly abolished its monarchy
# As a result, the Eternal City withered, the big BOOMS ceased
# the rule of Italy was given to all but lesser individuals, and the people of rome fell
# into decay and ruin, it seemed that all over the world that Italy would be disrespected
# but hope rekindled in the far off land of New Jersey, for a being of pure rizz manifested itself
# into existence, on the sacred grounds east of Ohio, this being had a name that one could only whisper
# "the Rizzler", who had a rizle glorian count so high that the rank of master could physically never be refused
# and just like how he acquired fame off of rizz alone, why wouldn't he be able to cash in his
# extraordinary gift for absolute power over one of Europe's oldest and greatest states, as his appearance on Jimmy Fallon
# suggests "the Rizzler is master of diplomacy and influence, he observes much, acts little, and speaks softly"
# while theres no doubt he has the makings of a statesman, what is the historical precedent for his potential ascension to the italian throne?
# though the rizzler does not hail directly from italy itself, he does come from two of the client regions
# of Italy, history has shown us that one doesn't need to be born in Italy to be emperor of rome, Trajan.
# perhaps one of Rome's finest emperors, was born in spain, and he too arguably rizzed his way to the throne despite overwhelming odds
# But I know what you're thinking dear reader, "The RIZZLER CANT CLAIM THE THRONE OF ITALY!, he's a kid who doesn't speak italian
# and has no blood claim to the throne", I will have you reminded tht Louis the 14th of France, the sun king, technically became king at 4
# George the 1st became King of England despite only being able to speak German and French,
# thats all, thanks 

/datum/round_event_control/wizard/fake_explosion //Oh no the station is gone!
	name = "Fake Nuclear Explosion"
	weight = 0 //Badmin exclusive now because once it's expected its not funny
	typepath = /datum/round_event/wizard/fake_explosion
	max_occurrences = 1
	earliest_start = 0

/datum/round_event/wizard/fake_explosion/start()
	procstart = null
	src.procstart = null
	sound_to_playing_players('sound/machines/alarm.ogg')
	sleep(100)
	Cinematic(CINEMATIC_NUKE_FAKE,world)
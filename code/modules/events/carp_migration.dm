/datum/round_event_control/carp_migration
	name = "Carp Migration"
	typepath = /datum/round_event/carp_migration
	weight = 15
	min_players = 2
	earliest_start = 6000
	max_occurrences = 6

/datum/round_event/carp_migration
	announceWhen	= 3
	startWhen = 50

/datum/round_event/carp_migration/setup()
	procstart = null
	src.procstart = null
	startWhen = rand(40, 60)

/datum/round_event/carp_migration/announce(fake)
	procstart = null
	src.procstart = null
	priority_announce("Unknown biological entities have been detected near [station_name()], please stand-by.", "Lifesign Alert")


/datum/round_event/carp_migration/start()
	procstart = null
	src.procstart = null
	for(var/obj/effect/landmark/carpspawn/C in GLOB.landmarks_list)
		if(prob(95))
			new /mob/living/simple_animal/hostile/carp(C.loc)
		else
			new /mob/living/simple_animal/hostile/carp/megacarp(C.loc)



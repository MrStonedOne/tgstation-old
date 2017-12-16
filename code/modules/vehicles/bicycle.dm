/obj/vehicle/bicycle
	name = "bicycle"
	desc = "Keep away from electricity."
	icon_state = "bicycle"
	var/easter_egg_chance = 1

	var/static/list/bike_music = list('sound/misc/bike1.mid',
								'sound/misc/bike2.mid',
								'sound/misc/bike3.mid')

/obj/vehicle/bicycle/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 4), TEXT_EAST = list(0, 4), TEXT_WEST = list( 0, 4)))
	D.vehicle_move_delay = 0

/obj/vehicle/bicycle/buckle_mob(mob/living/M, force = 0, check_loc = 1)
	procstart = null
	src.procstart = null
	if(prob(easter_egg_chance) || (SSevents.holidays && SSevents.holidays[APRIL_FOOLS]))
		SEND_SOUND(M, sound(pick(bike_music), repeat = 1, wait = 0, volume = 80, channel = CHANNEL_BICYCLE))
	. = ..()

/obj/vehicle/bicycle/unbuckle_mob(mob/living/buckled_mob,force = 0)
	procstart = null
	src.procstart = null
	if(buckled_mob)
		buckled_mob.stop_sound_channel(CHANNEL_BICYCLE)
	. =..()

/obj/vehicle/bicycle/tesla_act() // :::^^^)))
	procstart = null
	src.procstart = null
	name = "fried bicycle"
	desc = "Well spent."
	color = rgb(63, 23, 4)
	can_buckle = FALSE
	for(var/m in buckled_mobs)
		unbuckle_mob(m,1)

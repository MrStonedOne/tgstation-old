//Note to future generations: I didn't write this god-awful code I just ported it to the event system and tried to make it less moon-speaky.
//Don't judge me D; ~Carn //Maximum judging occuring - Remie.
// Tut tut Remie, let's keep our comments constructive. - coiax

/*

Contents:
- The Ninja "Random" Event
- Ninja creation code
*/

/datum/round_event_control/ninja
	name = "Space Ninja"
	typepath = /datum/round_event/ghost_role/ninja
	max_occurrences = 1
	earliest_start = 30000 // 1 hour
	min_players = 15

/datum/round_event/ghost_role/ninja
	var/success_spawn = 0
	role_name = "space ninja"
	minimum_required = 1

	var/helping_station
	var/spawn_loc
	var/give_objectives = TRUE

/datum/round_event/ghost_role/ninja/setup()
	procstart = null
	src.procstart = null
	helping_station = rand(0,1)


/datum/round_event/ghost_role/ninja/kill()
	procstart = null
	src.procstart = null
	if(!success_spawn && control)
		control.occurrences--
	return ..()


/datum/round_event/ghost_role/ninja/spawn_role()
	procstart = null
	src.procstart = null
	//selecting a spawn_loc
	if(!spawn_loc)
		var/list/spawn_locs = list()
		for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
			if(isturf(L.loc))
				spawn_locs += L.loc
		if(!spawn_locs.len)
			return kill()
		spawn_loc = pick(spawn_locs)
	if(!spawn_loc)
		return MAP_ERROR

	//selecting a candidate player
	var/list/candidates = get_candidates("ninja", null, ROLE_NINJA)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected_candidate = pick_n_take(candidates)
	var/key = selected_candidate.key

	//Prepare ninja player mind
	var/datum/mind/Mind = create_ninja_mind(key)
	Mind.active = 1

	//generate objectives - You'll generally get 6 objectives (Ninja is meant to be hardmode!)


	//spawn the ninja and assign the candidate
	var/mob/living/carbon/human/Ninja = create_space_ninja(spawn_loc)
	Mind.transfer_to(Ninja)
	var/datum/antagonist/ninja/ninjadatum = add_ninja(Ninja)
	ninjadatum.equip_space_ninja()

	if(Ninja.mind != Mind)			//something has gone wrong!
		throw EXCEPTION("Ninja created with incorrect mind")

	SSticker.mode.update_ninja_icons_added(Ninja)
	spawned_mobs += Ninja
	message_admins("[key_name_admin(Ninja)] has been made into a ninja by an event.")
	log_game("[key_name(Ninja)] was spawned as a ninja by an event.")

	return SUCCESSFUL_SPAWN


//=======//NINJA CREATION PROCS//=======//

/proc/create_space_ninja(spawn_loc)
	procstart = null
	src.procstart = null
	var/mob/living/carbon/human/new_ninja = new(spawn_loc)
	var/datum/preferences/A = new()//Randomize appearance for the ninja.
	A.real_name = "[pick(GLOB.ninja_titles)] [pick(GLOB.ninja_names)]"
	A.copy_to(new_ninja)
	new_ninja.dna.update_dna_identity()
	return new_ninja


/proc/create_ninja_mind(key)
	procstart = null
	src.procstart = null
	var/datum/mind/Mind = new /datum/mind(key)
	Mind.assigned_role = "Space Ninja"
	Mind.special_role = "Space Ninja"
	SSticker.mode.traitors |= Mind			//Adds them to current traitor list. TODO : Remove this in admin tools refeactor.
	return Mind


/datum/game_mode/proc/update_ninja_icons_added(var/mob/living/carbon/human/ninja)
	procstart = null
	src.procstart = null
	var/datum/atom_hud/antag/ninjahud = GLOB.huds[ANTAG_HUD_NINJA]
	ninjahud.join_hud(ninja)
	set_antag_hud(ninja, "ninja")

/datum/game_mode/proc/update_ninja_icons_removed(datum/mind/ninja_mind)
	procstart = null
	src.procstart = null
	var/datum/atom_hud/antag/ninjahud = GLOB.huds[ANTAG_HUD_NINJA]
	ninjahud.leave_hud(ninja_mind.current)
	set_antag_hud(ninja_mind.current, null)

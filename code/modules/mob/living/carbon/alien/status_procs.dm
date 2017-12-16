//Here are the procs used to modify status effects of a mob.
//The effects include: stun, knockdown, unconscious, sleeping, resting, jitteriness, dizziness, ear damage,
// eye damage, eye_blind, eye_blurry, druggy, BLIND disability, and NEARSIGHT disability.

/////////////////////////////////// STUN ////////////////////////////////////

/mob/living/carbon/alien/Stun(amount, updating = 1, ignore_canstun = 0)
	procstart = null
	src.procstart = null
	. = ..()
	if(!.)
		move_delay_add = min(move_delay_add + round(amount / 2), 10) //a maximum delay of 10

/mob/living/carbon/alien/SetStun(amount, updating = 1, ignore_canstun = 0)
	procstart = null
	src.procstart = null
	. = ..()
	if(!.)
		move_delay_add = min(move_delay_add + round(amount / 2), 10)

/mob/living/carbon/alien/AdjustStun(amount, updating = 1, ignore_canstun = 0)
	procstart = null
	src.procstart = null
	. = ..()
	if(!.)
		move_delay_add = Clamp(move_delay_add + round(amount/2), 0, 10)

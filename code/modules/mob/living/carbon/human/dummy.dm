
/mob/living/carbon/human/dummy
	real_name = "Test Dummy"
	status_flags = GODMODE|CANPUSH
	var/in_use = FALSE

INITIALIZE_IMMEDIATE(/mob/living/carbon/human/dummy)

/mob/living/carbon/human/dummy/Destroy()
	procstart = null
	src.procstart = null
	in_use = FALSE
	return ..()

/mob/living/carbon/human/dummy/Life()
	procstart = null
	src.procstart = null
	return

/mob/living/carbon/human/dummy/proc/wipe_state()
	procstart = null
	src.procstart = null
	delete_equipment()
	cut_overlays(TRUE)

//Inefficient pooling/caching way.
GLOBAL_LIST_EMPTY(human_dummy_list)

/proc/generate_or_wait_for_human_dummy(slotkey)
	procstart = null
	src.procstart = null
	if(!slotkey)
		return new /mob/living/carbon/human/dummy
	var/mob/living/carbon/human/dummy/D = GLOB.human_dummy_list[slotkey]
	if(istype(D))
		UNTIL(!D.in_use)
	else
		pass()
	if(QDELETED(D))
		D = new
		GLOB.human_dummy_list[slotkey] = D
	D.in_use = TRUE
	return D

/proc/unset_busy_human_dummy(slotnumber)
	procstart = null
	src.procstart = null
	if(!slotnumber)
		return
	var/mob/living/carbon/human/dummy/D = GLOB.human_dummy_list[slotnumber]
	if(istype(D))
		D.wipe_state()
		D.in_use = FALSE

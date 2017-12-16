/*
So much of atmospherics.dm was used solely by components, so separating this makes things all a lot cleaner.
On top of that, now people can add component-speciic procs/vars if they want!
*/

/obj/machinery/atmospherics/components
	var/welded = FALSE //Used on pumps and scrubbers
	var/showpipe = FALSE

	var/list/datum/pipeline/parents
	var/list/datum/gas_mixture/airs

/obj/machinery/atmospherics/components/New()
	procstart = null
	src.procstart = null
	parents = new(device_type)
	airs = new(device_type)
	..()

	for(DEVICE_TYPE_LOOP)
		var/datum/gas_mixture/A = new
		A.volume = 200
		AIR_I = A
/*
Iconnery
*/

/obj/machinery/atmospherics/components/proc/update_icon_nopipes()
	procstart = null
	src.procstart = null
	return

/obj/machinery/atmospherics/components/update_icon()
	procstart = null
	src.procstart = null
	update_icon_nopipes()

	underlays.Cut()

	var/turf/T = loc
	if(level == 2 || !T.intact)
		showpipe = TRUE
	else
		showpipe = FALSE

	if(!showpipe)
		return //no need to update the pipes if they aren't showing

	var/connected = 0 //Direction bitset

	for(DEVICE_TYPE_LOOP) //adds intact pieces
		if(NODE_I)
			connected |= icon_addintact(NODE_I)

	icon_addbroken(connected) //adds broken pieces


/*
Pipenet stuff; housekeeping
*/

/obj/machinery/atmospherics/components/nullifyNode(I)
	procstart = null
	src.procstart = null
	..()
	if(NODE_I)
		nullifyPipenet(PARENT_I)
		qdel(AIR_I)
		AIR_I = null

/obj/machinery/atmospherics/components/on_construction()
	procstart = null
	src.procstart = null
	..()
	update_parents()

/obj/machinery/atmospherics/components/build_network()
	procstart = null
	src.procstart = null
	for(DEVICE_TYPE_LOOP)
		if(!PARENT_I)
			PARENT_I = new /datum/pipeline()
			var/datum/pipeline/P = PARENT_I
			P.build_pipeline(src)

/obj/machinery/atmospherics/components/proc/nullifyPipenet(datum/pipeline/reference)
	procstart = null
	src.procstart = null
	var/I = parents.Find(reference)
	reference.other_airs -= AIR_I
	reference.other_atmosmch -= src
	PARENT_I = null

/obj/machinery/atmospherics/components/returnPipenetAir(datum/pipeline/reference)
	procstart = null
	src.procstart = null
	var/I = parents.Find(reference)
	return AIR_I

/obj/machinery/atmospherics/components/pipeline_expansion(datum/pipeline/reference)
	procstart = null
	src.procstart = null
	if(reference)
		var/I = parents.Find(reference)
		return list(NODE_I)
	else
		return ..()

/obj/machinery/atmospherics/components/setPipenet(datum/pipeline/reference, obj/machinery/atmospherics/A)
	procstart = null
	src.procstart = null
	var/I = nodes.Find(A)
	PARENT_I = reference

/obj/machinery/atmospherics/components/returnPipenet(obj/machinery/atmospherics/A = NODE1) //returns PARENT1 if called without argument
	var/I = nodes.Find(A)
	return PARENT_I

/obj/machinery/atmospherics/components/replacePipenet(datum/pipeline/Old, datum/pipeline/New)
	procstart = null
	src.procstart = null
	var/I = parents.Find(Old)
	PARENT_I = New

/obj/machinery/atmospherics/components/unsafe_pressure_release(var/mob/user, var/pressures)
	procstart = null
	src.procstart = null
	..()

	var/turf/T = get_turf(src)
	if(T)
		//Remove the gas from airs and assume it
		var/datum/gas_mixture/environment = T.return_air()
		var/lost = null
		var/times_lost = 0
		for(DEVICE_TYPE_LOOP)
			var/datum/gas_mixture/air = AIR_I
			lost += pressures*environment.volume/(air.temperature * R_IDEAL_GAS_EQUATION)
			times_lost++
		var/shared_loss = lost/times_lost

		var/datum/gas_mixture/to_release
		for(DEVICE_TYPE_LOOP)
			var/datum/gas_mixture/air = AIR_I
			if(!to_release)
				to_release = air.remove(shared_loss)
				continue
			to_release.merge(air.remove(shared_loss))
		T.assume_air(to_release)
		air_update_turf(1)

/obj/machinery/atmospherics/components/proc/safe_input(var/title, var/text, var/default_set)
	procstart = null
	src.procstart = null
	var/new_value = input(usr,text,title,default_set) as num
	if(usr.canUseTopic(src))
		return new_value
	return default_set

/*
Helpers
*/

/obj/machinery/atmospherics/components/proc/update_parents()
	procstart = null
	src.procstart = null
	for(DEVICE_TYPE_LOOP)
		var/datum/pipeline/parent = PARENT_I
		if(!parent)
			throw EXCEPTION("Component is missing a pipenet! Rebuilding...")
			build_network()
		parent.update = 1

/obj/machinery/atmospherics/components/returnPipenets()
	procstart = null
	src.procstart = null
	. = list()
	for(DEVICE_TYPE_LOOP)
		. += returnPipenet(NODE_I)

/*
UI Stuff
*/

/obj/machinery/atmospherics/components/ui_status(mob/user)
	procstart = null
	src.procstart = null
	if(allowed(user))
		return ..()
	to_chat(user, "<span class='danger'>Access denied.</span>")
	return UI_CLOSE


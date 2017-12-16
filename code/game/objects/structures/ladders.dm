// Basic ladder. By default links to the z-level above/below.
/obj/structure/ladder
	name = "ladder"
	desc = "A sturdy metal ladder."
	icon = 'icons/obj/structures.dmi'
	icon_state = "ladder11"
	anchored = TRUE
	var/obj/structure/ladder/down   //the ladder below this one
	var/obj/structure/ladder/up     //the ladder above this one

/obj/structure/ladder/Initialize(mapload, obj/structure/ladder/up, obj/structure/ladder/down)
	procstart = null
	src.procstart = null
	..()
	if (up)
		src.up = up
		up.down = src
		up.update_icon()
	if (down)
		src.down = down
		down.up = src
		down.update_icon()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/ladder/Destroy(force)
	procstart = null
	src.procstart = null
	if ((resistance_flags & INDESTRUCTIBLE) && !force)
		return QDEL_HINT_LETMELIVE

	if(up && up.down == src)
		up.down = null
		up.update_icon()
	if(down && down.up == src)
		down.up = null
		down.update_icon()
	return ..()

/obj/structure/ladder/LateInitialize()
	procstart = null
	src.procstart = null
	// By default, discover ladders above and below us vertically
	var/turf/T = get_turf(src)

	if (!down)
		for (var/obj/structure/ladder/L in locate(T.x, T.y, T.z - 1))
			down = L
			L.up = src  // Don't waste effort looping the other way
			L.update_icon()
			break
	if (!up)
		for (var/obj/structure/ladder/L in locate(T.x, T.y, T.z + 1))
			up = L
			L.down = src  // Don't waste effort looping the other way
			L.update_icon()
			break

	update_icon()

/obj/structure/ladder/update_icon()
	procstart = null
	src.procstart = null
	if(up && down)
		icon_state = "ladder11"

	else if(up)
		icon_state = "ladder10"

	else if(down)
		icon_state = "ladder01"

	else	//wtf make your ladders properly assholes
		icon_state = "ladder00"

/obj/structure/ladder/singularity_pull()
	procstart = null
	src.procstart = null
	if (!(resistance_flags & INDESTRUCTIBLE))
		visible_message("<span class='danger'>[src] is torn to pieces by the gravitational pull!</span>")
		qdel(src)

/obj/structure/ladder/proc/travel(going_up, mob/user, is_ghost, obj/structure/ladder/ladder)
	procstart = null
	src.procstart = null
	if(!is_ghost)
		show_fluff_message(going_up, user)
		ladder.add_fingerprint(user)

	var/turf/T = get_turf(ladder)
	var/atom/movable/AM
	if(user.pulling)
		AM = user.pulling
		AM.forceMove(T)
	user.forceMove(T)
	if(AM)
		user.start_pulling(AM)

/obj/structure/ladder/proc/use(mob/user, is_ghost=FALSE)
	procstart = null
	src.procstart = null
	if (!is_ghost && !in_range(src, user))
		return

	if (up && down)
		var/result = alert("Go up or down [src]?", "Ladder", "Up", "Down", "Cancel")
		if (!is_ghost && !in_range(src, user))
			return  // nice try
		switch(result)
			if("Up")
				travel(TRUE, user, is_ghost, up)
			if("Down")
				travel(FALSE, user, is_ghost, down)
			if("Cancel")
				return
	else if(up)
		travel(TRUE, user, is_ghost, up)
	else if(down)
		travel(FALSE, user, is_ghost, down)
	else
		to_chat(user, "<span class='warning'>[src] doesn't seem to lead anywhere!</span>")

	if(!is_ghost)
		add_fingerprint(user)

/obj/structure/ladder/attack_hand(mob/user)
	procstart = null
	src.procstart = null
	use(user)

/obj/structure/ladder/attack_paw(mob/user)
	procstart = null
	src.procstart = null
	return use(user)

/obj/structure/ladder/attackby(obj/item/W, mob/user, params)
	procstart = null
	src.procstart = null
	return use(user)

/obj/structure/ladder/attack_robot(mob/living/silicon/robot/R)
	procstart = null
	src.procstart = null
	if(R.Adjacent(src))
		return use(R)

/obj/structure/ladder/attack_ghost(mob/dead/observer/user)
	procstart = null
	src.procstart = null
	use(user, TRUE)

/obj/structure/ladder/proc/show_fluff_message(going_up, mob/user)
	procstart = null
	src.procstart = null
	if(going_up)
		user.visible_message("[user] climbs up [src].","<span class='notice'>You climb up [src].</span>")
	else
		user.visible_message("[user] climbs down [src].","<span class='notice'>You climb down [src].</span>")


// Indestructible away mission ladders which link based on a mapped ID and height value rather than X/Y/Z.
/obj/structure/ladder/unbreakable
	name = "sturdy ladder"
	desc = "An extremely sturdy metal ladder."
	resistance_flags = INDESTRUCTIBLE
	var/id
	var/height = 0  // higher numbers are considered physically higher

/obj/structure/ladder/unbreakable/Initialize()
	procstart = null
	src.procstart = null
	GLOB.ladders += src
	return ..()

/obj/structure/ladder/unbreakable/Destroy()
	procstart = null
	src.procstart = null
	. = ..()
	if (. != QDEL_HINT_LETMELIVE)
		GLOB.ladders -= src

/obj/structure/ladder/unbreakable/LateInitialize()
	procstart = null
	src.procstart = null
	// Override the parent to find ladders based on being height-linked
	if (!id || (up && down))
		update_icon()
		return

	for (var/O in GLOB.ladders)
		var/obj/structure/ladder/unbreakable/L = O
		if (L.id != id)
			continue  // not one of our pals
		if (!down && L.height == height - 1)
			down = L
			L.up = src
			L.update_icon()
			if (up)
				break  // break if both our connections are filled
		else if (!up && L.height == height + 1)
			up = L
			L.down = src
			L.update_icon()
			if (down)
				break  // break if both our connections are filled

	update_icon()

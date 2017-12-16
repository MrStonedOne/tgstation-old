//PIMP-CART
/obj/vehicle/ridden/janicart
	name = "janicart (pimpin' ride)"
	desc = "A brave janitor cyborg gave its life to produce such an amazing combination of speed and utility."
	icon_state = "pussywagon"
	key_type = /obj/item/key/janitor
	var/obj/item/storage/bag/trash/mybag = null
	var/floorbuffer = FALSE

/obj/vehicle/ridden/janicart/Initialize(mapload)
	procstart = null
	src.procstart = null
	. = ..()
	update_icon()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 7), TEXT_EAST = list(-12, 7), TEXT_WEST = list( 12, 7)))

/obj/vehicle/ridden/janicart/Destroy()
	procstart = null
	src.procstart = null
	if(mybag)
		qdel(mybag)
		mybag = null
	. = ..()

/obj/item/janiupgrade
	name = "floor buffer upgrade"
	desc = "An upgrade for mobile janicarts."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "upgrade"

/obj/vehicle/ridden/janicart/examine(mob/user)
	procstart = null
	src.procstart = null
	..()
	if(floorbuffer)
		to_chat(user, "It has been upgraded with a floor buffer.")

/obj/vehicle/ridden/janicart/attackby(obj/item/I, mob/user, params)
	procstart = null
	src.procstart = null
	if(istype(I, /obj/item/storage/bag/trash))
		if(mybag)
			to_chat(user, "<span class='warning'>[src] already has a trashbag hooked!</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		to_chat(user, "<span class='notice'>You hook the trashbag onto [src].</span>")
		mybag = I
		update_icon()
	else if(istype(I, /obj/item/janiupgrade))
		if(floorbuffer)
			to_chat(user, "<span class='warning'>[src] already has a floor buffer!</span>")
			return
		floorbuffer = TRUE
		qdel(I)
		to_chat(user, "<span class='notice'>You upgrade [src] with the floor buffer.</span>")
		flags_1 |= CLEAN_ON_MOVE_1
		update_icon()
	else
		return ..()

/obj/vehicle/ridden/janicart/update_icon()
	procstart = null
	src.procstart = null
	cut_overlays()
	if(mybag)
		add_overlay("cart_garbage")
	if(floorbuffer)
		add_overlay("cart_buffer")

/obj/vehicle/ridden/janicart/attack_hand(mob/user)
	procstart = null
	src.procstart = null
	if(..())
		return 1
	else if(mybag)
		mybag.forceMove(get_turf(user))
		user.put_in_hands(mybag)
		mybag = null
		update_icon()

/obj/vehicle/ridden/janicart/upgraded
	floorbuffer = TRUE

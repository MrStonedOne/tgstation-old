// **********************
// Other harvested materials from plants (that are not food)
// **********************

/obj/item/grown // Grown weapons
	name = "grown_weapon"
	icon = 'icons/obj/hydroponics/harvest.dmi'
	resistance_flags = FLAMMABLE
	var/obj/item/seeds/seed = null // type path, gets converted to item on New(). It's safe to assume it's always a seed item.

/obj/item/grown/Initialize(newloc, obj/item/seeds/new_seed)
	procstart = null
	src.procstart = null
	. = ..()
	create_reagents(50)

	if(new_seed)
		seed = new_seed.Copy()
	else if(ispath(seed))
		// This is for adminspawn or map-placed growns. They get the default stats of their seed type.
		seed = new seed()
		seed.adjust_potency(50-seed.potency)

	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

	if(seed)
		for(var/datum/plant_gene/trait/T in seed.genes)
			T.on_new(src, newloc)

		if(istype(src, seed.product)) // no adding reagents if it is just a trash item
			seed.prepare_result(src)
		transform *= TransformUsingVariable(seed.potency, 100, 0.5)
		add_juice()


/obj/item/grown/attackby(obj/item/O, mob/user, params)
	procstart = null
	src.procstart = null
	..()
	if (istype(O, /obj/item/device/plant_analyzer))
		var/msg = "<span class='info'>*---------*\n This is \a <span class='name'>[src]</span>\n"
		if(seed)
			msg += seed.get_analyzer_text()
		msg += "</span>"
		to_chat(usr, msg)
		return

/obj/item/grown/proc/add_juice()
	procstart = null
	src.procstart = null
	if(reagents)
		return 1
	return 0


/obj/item/grown/Crossed(atom/movable/AM)
	procstart = null
	src.procstart = null
	if(seed)
		for(var/datum/plant_gene/trait/T in seed.genes)
			T.on_cross(src, AM)
	..()

/obj/item/grown/throw_impact(atom/hit_atom)
	procstart = null
	src.procstart = null
	if(!..()) //was it caught by a mob?
		if(seed)
			for(var/datum/plant_gene/trait/T in seed.genes)
				T.on_throw_impact(src, hit_atom)

/obj/item/grown/microwave_act(obj/machine/microwave/M)
	procstart = null
	src.procstart = null
	return

/obj/item/grown/on_grind()
	procstart = null
	src.procstart = null
	for(var/i in 1 to grind_results.len)
		grind_results[grind_results[i]] = round(seed.potency)

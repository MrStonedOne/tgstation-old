/*
	Station Airlocks Regular
*/

/obj/machinery/door/airlock/abandoned
	abandoned = TRUE

/obj/machinery/door/airlock/command
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_com
	normal_integrity = 450

/obj/machinery/door/airlock/security
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sec
	normal_integrity = 450

/obj/machinery/door/airlock/engineering
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_eng

/obj/machinery/door/airlock/engineering/abandoned
	abandoned = TRUE

/obj/machinery/door/airlock/medical
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_med

/obj/machinery/door/airlock/maintenance
	name = "maintenance access"
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_mai
	normal_integrity = 250

/obj/machinery/door/airlock/maintenance/abandoned
	abandoned = TRUE

/obj/machinery/door/airlock/maintenance/external
	name = "external airlock access"
	icon = 'icons/obj/doors/airlocks/station/maintenanceexternal.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_extmai

/obj/machinery/door/airlock/mining
	name = "mining airlock"
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_min

/obj/machinery/door/airlock/atmos
	name = "atmospherics airlock"
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_atmo

/obj/machinery/door/airlock/atmos/abandoned
	abandoned = TRUE

/obj/machinery/door/airlock/research
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_research

/obj/machinery/door/airlock/freezer
	name = "freezer airlock"
	icon = 'icons/obj/doors/airlocks/station/freezer.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_fre

/obj/machinery/door/airlock/science
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_science

/obj/machinery/door/airlock/virology
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_viro

//////////////////////////////////
/*
	Station Airlocks Glass
*/

/obj/machinery/door/airlock/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/glass_command
	icon = 'icons/obj/doors/airlocks/station/command.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_com
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/glass_engineering
	icon = 'icons/obj/doors/airlocks/station/engineering.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_eng
	glass = TRUE

/obj/machinery/door/airlock/glass_security
	icon = 'icons/obj/doors/airlocks/station/security.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_sec
	glass = TRUE
	normal_integrity = 400

/obj/machinery/door/airlock/glass_security/abandoned
	abandoned = TRUE

/obj/machinery/door/airlock/glass_medical
	icon = 'icons/obj/doors/airlocks/station/medical.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_med
	glass = TRUE

/obj/machinery/door/airlock/glass_research
	icon = 'icons/obj/doors/airlocks/station/research.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_research
	glass = TRUE

/obj/machinery/door/airlock/glass_mining
	icon = 'icons/obj/doors/airlocks/station/mining.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_min
	glass = TRUE

/obj/machinery/door/airlock/glass_atmos
	icon = 'icons/obj/doors/airlocks/station/atmos.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_atmo
	glass = TRUE

/obj/machinery/door/airlock/glass_science
	icon = 'icons/obj/doors/airlocks/station/science.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_science
	glass = TRUE

/obj/machinery/door/airlock/glass_virology
	icon = 'icons/obj/doors/airlocks/station/virology.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_viro
	glass = TRUE

/obj/machinery/door/airlock/glass_maintenance
	icon = 'icons/obj/doors/airlocks/station/maintenance.dmi'
	opacity = 0
	assemblytype = /obj/structure/door_assembly/door_assembly_mai
	glass = TRUE

/obj/machinery/door/airlock/maintenance/external/glass
	opacity = 0
	glass = TRUE
	normal_integrity = 200

//////////////////////////////////
/*
	Station Airlocks Mineral
*/

/obj/machinery/door/airlock/gold
	name = "gold airlock"
	icon = 'icons/obj/doors/airlocks/station/gold.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_gold

/obj/machinery/door/airlock/gold/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/silver
	name = "silver airlock"
	icon = 'icons/obj/doors/airlocks/station/silver.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_silver

/obj/machinery/door/airlock/silver/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/diamond
	name = "diamond airlock"
	icon = 'icons/obj/doors/airlocks/station/diamond.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_diamond
	normal_integrity = 1000
	explosion_block = 2

/obj/machinery/door/airlock/diamond/glass
	normal_integrity = 950
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/uranium
	name = "uranium airlock"
	icon = 'icons/obj/doors/airlocks/station/uranium.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_uranium
	var/last_event = 0

/obj/machinery/door/airlock/uranium/process()
	procstart = null
	src.procstart = null
	if(world.time > last_event+20)
		if(prob(50))
			radiate()
		last_event = world.time
	..()

/obj/machinery/door/airlock/uranium/proc/radiate()
	procstart = null
	src.procstart = null
	radiation_pulse(get_turf(src), 150)
	return

/obj/machinery/door/airlock/uranium/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/plasma
	name = "plasma airlock"
	desc = "No way this can end badly."
	icon = 'icons/obj/doors/airlocks/station/plasma.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_plasma

/obj/machinery/door/airlock/plasma/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	procstart = null
	src.procstart = null
	if(exposed_temperature > 300)
		PlasmaBurn(exposed_temperature)

/obj/machinery/door/airlock/plasma/proc/ignite(exposed_temperature)
	procstart = null
	src.procstart = null
	if(exposed_temperature > 300)
		PlasmaBurn(exposed_temperature)

/obj/machinery/door/airlock/plasma/proc/PlasmaBurn(temperature)
	procstart = null
	src.procstart = null
	atmos_spawn_air("plasma=500;TEMP=1000")
	var/obj/structure/door_assembly/DA
	DA = new /obj/structure/door_assembly(loc)
	if(glass)
		DA.glass = TRUE
	if(heat_proof)
		DA.heat_proof_finished = TRUE
	DA.update_icon()
	DA.update_name()
	qdel(src)

/obj/machinery/door/airlock/plasma/BlockSuperconductivity() //we don't stop the heat~
	return 0

/obj/machinery/door/airlock/plasma/attackby(obj/item/C, mob/user, params)
	procstart = null
	src.procstart = null
	if(C.is_hot() > 300)//If the temperature of the object is over 300, then ignite
		message_admins("Plasma airlock ignited by [ADMIN_LOOKUPFLW(user)] in [ADMIN_COORDJMP(src)]")
		log_game("Plasma airlock ignited by [key_name(user)] in [COORD(src)]")
		ignite(C.is_hot())
	else
		return ..()

/obj/machinery/door/airlock/plasma/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/clown
	name = "bananium airlock"
	desc = "Honkhonkhonk"
	icon = 'icons/obj/doors/airlocks/station/bananium.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_bananium
	doorOpen = 'sound/items/bikehorn.ogg'

/obj/machinery/door/airlock/clown/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/sandstone
	name = "sandstone airlock"
	icon = 'icons/obj/doors/airlocks/station/sandstone.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_sandstone

/obj/machinery/door/airlock/sandstone/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/wood
	name = "wooden airlock"
	icon = 'icons/obj/doors/airlocks/station/wood.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_wood

/obj/machinery/door/airlock/wood/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/titanium
	name = "shuttle airlock"
	assemblytype = /obj/structure/door_assembly/door_assembly_titanium
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	normal_integrity = 400

/obj/machinery/door/airlock/titanium/glass
	normal_integrity = 350
	opacity = 0
	glass = TRUE

//////////////////////////////////
/*
	Station2 Airlocks
*/

/obj/machinery/door/airlock/public
	icon = 'icons/obj/doors/airlocks/station2/glass.dmi'
	overlays_file = 'icons/obj/doors/airlocks/station2/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_public

/obj/machinery/door/airlock/public/glass
	opacity = 0
	glass = TRUE

//////////////////////////////////
/*
	External Airlocks
*/

/obj/machinery/door/airlock/external
	name = "external airlock"
	icon = 'icons/obj/doors/airlocks/external/external.dmi'
	overlays_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	note_overlay_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_ext

/obj/machinery/door/airlock/external/glass
	opacity = 0
	glass = TRUE

//////////////////////////////////
/*
	CentCom Airlocks
*/

/obj/machinery/door/airlock/centcom
	icon = 'icons/obj/doors/airlocks/centcom/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/centcom/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_centcom
	normal_integrity = 1000
	security_level = 6
	explosion_block = 2

/obj/machinery/door/airlock/centcom/abandoned
	abandoned = TRUE

//////////////////////////////////
/*
	Vault Airlocks
*/

/obj/machinery/door/airlock/vault
	name = "vault door"
	icon = 'icons/obj/doors/airlocks/vault/vault.dmi'
	overlays_file = 'icons/obj/doors/airlocks/vault/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_vault
	explosion_block = 2
	normal_integrity = 400 // reverse engieneerd: 400 * 1.5 (sec lvl 6) = 600 = original
	security_level = 6

//////////////////////////////////
/*
	Hatch Airlocks
*/

/obj/machinery/door/airlock/hatch
	name = "airtight hatch"
	icon = 'icons/obj/doors/airlocks/hatch/centcom.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_hatch

/obj/machinery/door/airlock/maintenance_hatch
	name = "maintenance hatch"
	icon = 'icons/obj/doors/airlocks/hatch/maintenance.dmi'
	overlays_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	note_overlay_file = 'icons/obj/doors/airlocks/hatch/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_mhatch

/obj/machinery/door/airlock/maintenance_hatch/abandoned
	abandoned = TRUE

//////////////////////////////////
/*
	High Security Airlocks
*/

/obj/machinery/door/airlock/highsecurity
	name = "high tech security airlock"
	icon = 'icons/obj/doors/airlocks/highsec/highsec.dmi'
	overlays_file = 'icons/obj/doors/airlocks/highsec/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_highsecurity
	explosion_block = 2
	normal_integrity = 500
	security_level = 1
	damage_deflection = 30

//////////////////////////////////
/*
	Shuttle Airlocks
*/

/obj/machinery/door/airlock/shuttle
	name = "shuttle airlock"
	icon = 'icons/obj/doors/airlocks/shuttle/shuttle.dmi'
	overlays_file = 'icons/obj/doors/airlocks/shuttle/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_shuttle

/obj/machinery/door/airlock/shuttle/glass
	opacity = 0
	glass = TRUE

/obj/machinery/door/airlock/abductor
	name = "alien airlock"
	desc = "With humanity's current technological level, it could take years to hack this advanced airlock... or maybe we should give a screwdriver a try?"
	icon = 'icons/obj/doors/airlocks/abductor/abductor_airlock.dmi'
	overlays_file = 'icons/obj/doors/airlocks/abductor/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_abductor
	note_overlay_file = 'icons/obj/doors/airlocks/external/overlays.dmi'
	damage_deflection = 30
	explosion_block = 3
	hackProof = TRUE
	aiControlDisabled = 1
	normal_integrity = 700
	security_level = 1

//////////////////////////////////
/*
	Cult Airlocks
*/

/obj/machinery/door/airlock/cult
	name = "cult airlock"
	icon = 'icons/obj/doors/airlocks/cult/runed/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/runed/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_cult
	hackProof = TRUE
	aiControlDisabled = TRUE
	req_access = list(ACCESS_BLOODCULT)
	var/openingoverlaytype = /obj/effect/temp_visual/cult/door
	var/friendly = FALSE

/obj/machinery/door/airlock/cult/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new openingoverlaytype(loc)

/obj/machinery/door/airlock/cult/canAIControl(mob/user)
	procstart = null
	src.procstart = null
	return (iscultist(user) && !isAllPowerCut())

/obj/machinery/door/airlock/cult/allowed(mob/living/L)
	procstart = null
	src.procstart = null
	if(!density)
		return 1
	if(friendly || iscultist(L) || istype(L, /mob/living/simple_animal/shade) || isconstruct(L))
		new openingoverlaytype(loc)
		return 1
	else
		new /obj/effect/temp_visual/cult/sac(loc)
		var/atom/throwtarget
		throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
		SEND_SOUND(L, sound(pick('sound/hallucinations/turn_around1.ogg','sound/hallucinations/turn_around2.ogg'),0,1,50))
		flash_color(L, flash_color="#960000", flash_time=20)
		L.Knockdown(40)
		L.throw_at(throwtarget, 5, 1,src)
		return 0

/obj/machinery/door/airlock/cult/narsie_act()
	procstart = null
	src.procstart = null
	return

/obj/machinery/door/airlock/cult/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/glass
	glass = TRUE
	opacity = 0

/obj/machinery/door/airlock/cult/glass/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/unruned
	icon = 'icons/obj/doors/airlocks/cult/unruned/cult.dmi'
	overlays_file = 'icons/obj/doors/airlocks/cult/unruned/overlays.dmi'
	assemblytype = /obj/structure/door_assembly/door_assembly_cult/unruned
	openingoverlaytype = /obj/effect/temp_visual/cult/door/unruned

/obj/machinery/door/airlock/cult/unruned/friendly
	friendly = TRUE

/obj/machinery/door/airlock/cult/unruned/glass
	glass = TRUE
	opacity = 0

/obj/machinery/door/airlock/cult/unruned/glass/friendly
	friendly = TRUE

//Pinion airlocks: Clockwork doors that only let servants of Ratvar through.
/obj/machinery/door/airlock/clockwork
	name = "pinion airlock"
	desc = "A massive cogwheel set into two heavy slabs of brass."
	icon = 'icons/obj/doors/airlocks/clockwork/pinion_airlock.dmi'
	overlays_file = 'icons/obj/doors/airlocks/clockwork/overlays.dmi'
	hackProof = TRUE
	aiControlDisabled = TRUE
	req_access = list(ACCESS_CLOCKCULT)
	use_power = FALSE
	resistance_flags = FIRE_PROOF | ACID_PROOF
	damage_deflection = 30
	normal_integrity = 240
	var/construction_state = GEAR_SECURE //Pinion airlocks have custom deconstruction

/obj/machinery/door/airlock/clockwork/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new /obj/effect/temp_visual/ratvar/door(loc)
	new /obj/effect/temp_visual/ratvar/beam/door(loc)
	change_construction_value(5)

/obj/machinery/door/airlock/clockwork/Destroy()
	procstart = null
	src.procstart = null
	change_construction_value(-5)
	return ..()

/obj/machinery/door/airlock/clockwork/examine(mob/user)
	procstart = null
	src.procstart = null
	..()
	var/gear_text = "The cogwheel is flickering and twisting wildly. Report this to a coder."
	switch(construction_state)
		if(GEAR_SECURE)
			gear_text = "<span class='brass'>The cogwheel is solidly <b>wrenched</b> to the brass around it.</span>"
		if(GEAR_LOOSE)
			gear_text = "<span class='alloy'>The cogwheel has been <i>loosened</i>, but remains <b>connected loosely</b> to the door!</span>"
	to_chat(user, gear_text)

/obj/machinery/door/airlock/clockwork/emp_act(severity)
	procstart = null
	src.procstart = null
	if(prob(80/severity))
		open()

/obj/machinery/door/airlock/clockwork/canAIControl(mob/user)
	procstart = null
	src.procstart = null
	return (is_servant_of_ratvar(user) && !isAllPowerCut())

/obj/machinery/door/airlock/clockwork/ratvar_act()
	procstart = null
	src.procstart = null
	return 0

/obj/machinery/door/airlock/clockwork/narsie_act()
	procstart = null
	src.procstart = null
	..()
	if(src)
		var/previouscolor = color
		color = "#960000"
		animate(src, color = previouscolor, time = 8)
		addtimer(CALLBACK(src, /atom/proc/update_atom_colour), 8)

/obj/machinery/door/airlock/clockwork/attackby(obj/item/I, mob/living/user, params)
	procstart = null
	src.procstart = null
	if(!attempt_construction(I, user))
		return ..()

/obj/machinery/door/airlock/clockwork/allowed(mob/M)
	procstart = null
	src.procstart = null
	if(is_servant_of_ratvar(M))
		return 1
	return 0

/obj/machinery/door/airlock/clockwork/hasPower()
	procstart = null
	src.procstart = null
	return TRUE //yes we do have power

/obj/machinery/door/airlock/clockwork/obj_break(damage_flag)
	procstart = null
	src.procstart = null
	return

/obj/machinery/door/airlock/clockwork/deconstruct(disassembled = TRUE)
	procstart = null
	src.procstart = null
	playsound(src, 'sound/items/deconstruct.ogg', 50, 1)
	if(!(flags_1 & NODECONSTRUCT_1))
		var/turf/T = get_turf(src)
		if(disassembled)
			new/obj/item/stack/tile/brass(T, 4)
		else
			new/obj/item/clockwork/alloy_shards(T)
		new/obj/item/clockwork/alloy_shards/pinion_lock(T)
	qdel(src)

/obj/machinery/door/airlock/clockwork/proc/attempt_construction(obj/item/I, mob/living/user)
	procstart = null
	src.procstart = null
	if(!I || !user || !user.canUseTopic(src))
		return 0
	else if(istype(I, /obj/item/wrench))
		if(construction_state == GEAR_SECURE)
			user.visible_message("<span class='notice'>[user] begins loosening [src]'s cogwheel...</span>", "<span class='notice'>You begin loosening [src]'s cogwheel...</span>")
			playsound(src, I.usesound, 50, 1)
			if(!do_after(user, 75*I.toolspeed, target = src) || construction_state != GEAR_SECURE)
				return 1
			user.visible_message("<span class='notice'>[user] loosens [src]'s cogwheel!</span>", "<span class='notice'>[src]'s cogwheel pops off and dangles loosely.</span>")
			playsound(src, 'sound/items/deconstruct.ogg', 50, 1)
			construction_state = GEAR_LOOSE
		else if(construction_state == GEAR_LOOSE)
			user.visible_message("<span class='notice'>[user] begins tightening [src]'s cogwheel...</span>", "<span class='notice'>You begin tightening [src]'s cogwheel into place...</span>")
			playsound(src, I.usesound, 50, 1)
			if(!do_after(user, 75*I.toolspeed, target = src) || construction_state != GEAR_LOOSE)
				return 1
			user.visible_message("<span class='notice'>[user] tightens [src]'s cogwheel!</span>", "<span class='notice'>You firmly tighten [src]'s cogwheel into place.</span>")
			playsound(src, 'sound/items/deconstruct.ogg', 50, 1)
			construction_state = GEAR_SECURE
		return 1
	else if(istype(I, /obj/item/crowbar))
		if(construction_state == GEAR_SECURE)
			to_chat(user, "<span class='warning'>[src]'s cogwheel is too tightly secured! Your [I.name] can't reach under it!</span>")
			return 1
		else if(construction_state == GEAR_LOOSE)
			user.visible_message("<span class='notice'>[user] begins slowly lifting off [src]'s cogwheel...</span>", "<span class='notice'>You slowly begin lifting off [src]'s cogwheel...</span>")
			playsound(src, I.usesound, 50, 1)
			if(!do_after(user, 75*I.toolspeed, target = src) || construction_state != GEAR_LOOSE)
				return 1
			user.visible_message("<span class='notice'>[user] lifts off [src]'s cogwheel, causing it to fall apart!</span>", \
			"<span class='notice'>You lift off [src]'s cogwheel, causing it to fall apart!</span>")
			deconstruct(TRUE)
		return 1
	return 0

/obj/machinery/door/airlock/clockwork/brass
	glass = TRUE
	opacity = 0

//////////////////////////////////
/*
	Misc Airlocks
*/

/obj/machinery/door/airlock/glass_large
	name = "large glass airlock"
	icon = 'icons/obj/doors/airlocks/glass_large/glass_large.dmi'
	overlays_file = 'icons/obj/doors/airlocks/glass_large/overlays.dmi'
	opacity = 0
	assemblytype = null
	glass = TRUE
	bound_width = 64 // 2x1

/obj/machinery/door/airlock/glass_large/narsie_act()
	procstart = null
	src.procstart = null
	return

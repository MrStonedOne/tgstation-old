/obj/machinery/atmospherics/components/unary
	icon = 'icons/obj/atmospherics/components/unary_devices.dmi'
	dir = SOUTH
	initialize_directions = SOUTH
	device_type = UNARY
	pipe_flags = PIPING_ONE_PER_TURF
	construction_type = /obj/item/pipe/directional
	var/uid
	var/static/gl_uid = 1

/obj/machinery/atmospherics/components/unary/SetInitDirections()
	procstart = null
	src.procstart = null
	initialize_directions = dir

/obj/machinery/atmospherics/components/unary/on_construction()
	procstart = null
	src.procstart = null
	..()
	update_icon()

/obj/machinery/atmospherics/components/unary/hide(intact)
	procstart = null
	src.procstart = null
	update_icon()
	..(intact)

/obj/machinery/atmospherics/components/unary/proc/assign_uid_vents()
	procstart = null
	src.procstart = null
	uid = num2text(gl_uid++)
	return uid

/*
	The receiver idles and receives messages from subspace-compatible radio equipment;
	primarily headsets. They then just relay this information to all linked devices,
	which can would probably be network hubs.

	Link to Processor Units in case receiver can't send to bus units.
*/

/obj/machinery/telecomms/receiver
	name = "subspace receiver"
	icon_state = "broadcast receiver"
	desc = "This machine has a dish-like shape and green lights. It is designed to detect and process subspace radio activity."
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	machinetype = 1
	circuit = /obj/item/circuitboard/machine/telecomms/receiver

/obj/machinery/telecomms/receiver/receive_signal(datum/signal/signal)

	procstart = null
	src.procstart = null
	if(!on) // has to be on to receive messages
		return
	if(!signal)
		return
	if(!check_receive_level(signal))
		return
	if(signal.transmission_method == TRANSMISSION_SUBSPACE)

		if(is_freq_listening(signal)) // detect subspace signals

			//Remove the level and then start adding levels that it is being broadcasted in.
			signal.data["level"] = list()

			var/can_send = relay_information(signal, "/obj/machinery/telecomms/hub") // ideally relay the copied information to relays
			if(!can_send)
				relay_information(signal, "/obj/machinery/telecomms/bus") // Send it to a bus instead, if it's linked to one

/obj/machinery/telecomms/receiver/proc/check_receive_level(datum/signal/signal)

	procstart = null
	src.procstart = null
	if(signal.data["level"] != listening_level)
		for(var/obj/machinery/telecomms/hub/H in links)
			var/list/connected_levels = list()
			for(var/obj/machinery/telecomms/relay/R in H.links)
				if(R.can_receive(signal))
					connected_levels |= R.listening_level
			if(signal.data["level"] in connected_levels)
				return 1
		return 0
	return 1

//Preset Receivers

//--PRESET LEFT--//

/obj/machinery/telecomms/receiver/preset_left
	id = "Receiver A"
	network = "tcommsat"
	autolinkers = list("receiverA") // link to relay
	freq_listening = list(FREQ_SCIENCE, FREQ_MEDICAL, FREQ_SUPPLY, FREQ_SERVICE)


//--PRESET RIGHT--//

/obj/machinery/telecomms/receiver/preset_right
	id = "Receiver B"
	network = "tcommsat"
	autolinkers = list("receiverB") // link to relay
	freq_listening = list(FREQ_COMMAND, FREQ_ENGINEERING, FREQ_SECURITY)

	//Common and other radio frequencies for people to freely use
/obj/machinery/telecomms/receiver/preset_right/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	for(var/i = MIN_FREQ, i <= MAX_FREQ, i += 2)
		freq_listening |= i

/obj/machinery/telecomms/receiver/preset_left/birdstation
	name = "Receiver"
	freq_listening = list()
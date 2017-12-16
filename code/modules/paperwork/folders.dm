/obj/item/folder
	name = "folder"
	desc = "A folder."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "folder"
	w_class = WEIGHT_CLASS_SMALL
	pressure_resistance = 2
	resistance_flags = FLAMMABLE

/obj/item/folder/blue
	desc = "A blue folder."
	icon_state = "folder_blue"

/obj/item/folder/red
	desc = "A red folder."
	icon_state = "folder_red"

/obj/item/folder/yellow
	desc = "A yellow folder."
	icon_state = "folder_yellow"

/obj/item/folder/white
	desc = "A white folder."
	icon_state = "folder_white"


/obj/item/folder/update_icon()
	procstart = null
	src.procstart = null
	cut_overlays()
	if(contents.len)
		add_overlay("folder_paper")


/obj/item/folder/attackby(obj/item/W, mob/user, params)
	procstart = null
	src.procstart = null
	if(istype(W, /obj/item/paper) || istype(W, /obj/item/photo) || istype(W, /obj/item/documents))
		if(!user.transferItemToLoc(W, src))
			return
		to_chat(user, "<span class='notice'>You put [W] into [src].</span>")
		update_icon()
	else if(istype(W, /obj/item/pen))
		var/n_name = copytext(sanitize(input(user, "What would you like to label the folder?", "Folder Labelling", null) as text), 1, MAX_NAME_LEN)
		if((in_range(src,user) && user.stat == CONSCIOUS))
			name = "folder[(n_name ? " - '[n_name]'" : null)]"


/obj/item/folder/attack_self(mob/user)
	procstart = null
	src.procstart = null
	var/dat = "<title>[name]</title>"

	for(var/obj/item/I in src)
		dat += "<A href='?src=[REF(src)];remove=[REF(I)]'>Remove</A> - <A href='?src=[REF(src)];read=[REF(I)]'>[I.name]</A><BR>"
	user << browse(dat, "window=folder")
	onclose(user, "folder")
	add_fingerprint(usr)


/obj/item/folder/Topic(href, href_list)
	procstart = null
	src.procstart = null
	..()
	if(usr.stat || usr.restrained())
		return

	if(usr.contents.Find(src))

		if(href_list["remove"])
			var/obj/item/I = locate(href_list["remove"])
			if(istype(I) && I.loc == src)
				I.forceMove(usr.loc)
				usr.put_in_hands(I)

		if(href_list["read"])
			var/obj/item/I = locate(href_list["read"])
			if(istype(I) && I.loc == src)
				usr.examinate(I)

		//Update everything
		attack_self(usr)
		update_icon()

/obj/item/folder/documents
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of Nanotrasen Corporation. Unauthorized distribution is punishable by death.\""

/obj/item/folder/documents/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new /obj/item/documents/nanotrasen(src)
	update_icon()

/obj/item/folder/syndicate
	icon_state = "folder_syndie"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of The Syndicate.\""

/obj/item/folder/syndicate/red
	icon_state = "folder_sred"

/obj/item/folder/syndicate/red/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new /obj/item/documents/syndicate/red(src)
	update_icon()

/obj/item/folder/syndicate/blue
	icon_state = "folder_sblue"

/obj/item/folder/syndicate/blue/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new /obj/item/documents/syndicate/blue(src)
	update_icon()

/obj/item/folder/syndicate/mining/Initialize()
	procstart = null
	src.procstart = null
	. = ..()
	new /obj/item/documents/syndicate/mining(src)
	update_icon()

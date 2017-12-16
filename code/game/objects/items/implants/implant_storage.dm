/obj/item/storage/internal/implant
	name = "bluespace pocket"
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = 6
	cant_hold = list(/obj/item/disk/nuclear)
	silent = 1


/obj/item/implant/storage
	name = "storage implant"
	desc = "Stores up to two big items in a bluespace pocket."
	icon_state = "storage"
	item_color = "r"
	var/obj/item/storage/internal/implant/storage

/obj/item/implant/storage/New()
	procstart = null
	src.procstart = null
	..()
	storage = new /obj/item/storage/internal/implant(src)

/obj/item/implant/storage/activate()
	procstart = null
	src.procstart = null
	storage.MouseDrop(imp_in)

/obj/item/implant/storage/removed(source, silent = 0, special = 0)
	procstart = null
	src.procstart = null
	if(..())
		if(!special)
			storage.close_all()
			for(var/obj/item/I in storage)
				storage.remove_from_storage(I, get_turf(source))
		return 1

/obj/item/implant/storage/implant(mob/living/target, mob/user, silent = 0)
	procstart = null
	src.procstart = null
	for(var/X in target.implants)
		if(istype(X, type))
			var/obj/item/implant/storage/imp_e = X
			imp_e.storage.storage_slots += storage.storage_slots
			imp_e.storage.max_combined_w_class += storage.max_combined_w_class
			imp_e.storage.contents += storage.contents

			storage.close_all()
			storage.show_to(target)

			qdel(src)
			return 1

	return ..()

/obj/item/implanter/storage
	name = "implanter (storage)"
	imp_type = /obj/item/implant/storage

/obj/item/organ/appendix
	name = "appendix"
	icon_state = "appendix"
	zone = "groin"
	slot = ORGAN_SLOT_APPENDIX
	var/inflamed = 0

/obj/item/organ/appendix/update_icon()
	procstart = null
	src.procstart = null
	if(inflamed)
		icon_state = "appendixinflamed"
		name = "inflamed appendix"
	else
		icon_state = "appendix"
		name = "appendix"

/obj/item/organ/appendix/Remove(mob/living/carbon/M, special = 0)
	procstart = null
	src.procstart = null
	for(var/datum/disease/appendicitis/A in M.viruses)
		A.cure()
		inflamed = 1
	update_icon()
	..()

/obj/item/organ/appendix/Insert(mob/living/carbon/M, special = 0)
	procstart = null
	src.procstart = null
	..()
	if(inflamed)
		M.AddDisease(new /datum/disease/appendicitis)

/obj/item/organ/appendix/prepare_eat()
	procstart = null
	src.procstart = null
	var/obj/S = ..()
	if(inflamed)
		S.reagents.add_reagent("bad_food", 5)
	return S

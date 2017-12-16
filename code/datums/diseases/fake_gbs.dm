/datum/disease/fake_gbs
	name = "GBS"
	max_stages = 5
	spread_text = "On contact"
	spread_flags = VIRUS_SPREAD_BLOOD | VIRUS_SPREAD_CONTACT_SKIN | VIRUS_SPREAD_CONTACT_FLUIDS
	cure_text = "Synaptizine & Sulfur"
	cures = list("synaptizine","sulfur")
	agent = "Gravitokinetic Bipotential SADS-"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	desc = "If left untreated death will occur."
	severity = VIRUS_SEVERITY_BIOHAZARD

/datum/disease/fake_gbs/stage_act()
	procstart = null
	src.procstart = null
	..()
	switch(stage)
		if(2)
			if(prob(1))
				affected_mob.emote("sneeze")
		if(3)
			if(prob(5))
				affected_mob.emote("cough")
			else if(prob(5))
				affected_mob.emote("gasp")
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>You're starting to feel very weak...</span>")
		if(4)
			if(prob(10))
				affected_mob.emote("cough")

		if(5)
			if(prob(10))
				affected_mob.emote("cough")

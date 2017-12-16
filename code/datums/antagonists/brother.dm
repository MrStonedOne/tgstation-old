/datum/antagonist/brother
	name = "Brother"
	job_rank = ROLE_BROTHER
	var/special_role = "blood brother"
	var/datum/objective_team/brother_team/team

/datum/antagonist/brother/New(datum/mind/new_owner)
	procstart = null
	src.procstart = null
	return ..()

/datum/antagonist/brother/create_team(datum/objective_team/brother_team/new_team)
	procstart = null
	src.procstart = null
	if(!new_team)
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	team = new_team

/datum/antagonist/brother/get_team()
	procstart = null
	src.procstart = null
	return team

/datum/antagonist/brother/on_gain()
	procstart = null
	src.procstart = null
	SSticker.mode.brothers += owner
	owner.objectives += team.objectives
	owner.special_role = special_role
	finalize_brother()
	return ..()

/datum/antagonist/brother/on_removal()
	procstart = null
	src.procstart = null
	SSticker.mode.brothers -= owner
	owner.objectives -= team.objectives
	if(owner.current)
		to_chat(owner.current,"<span class='userdanger'>You are no longer the [special_role]!</span>")
	owner.special_role = null
	return ..()

/datum/antagonist/brother/proc/give_meeting_area()
	procstart = null
	src.procstart = null
	if(!owner.current || !team || !team.meeting_area)
		return
	to_chat(owner.current, "<B>Your designated meeting area:</B> [team.meeting_area]")
	owner.store_memory("<b>Meeting Area</b>: [team.meeting_area]")

/datum/antagonist/brother/greet()
	procstart = null
	src.procstart = null
	var/brother_text = ""
	var/list/brothers = team.members - owner
	for(var/i = 1 to brothers.len)
		var/datum/mind/M = brothers[i]
		brother_text += M.name
		if(i == brothers.len - 1)
			brother_text += " and "
		else if(i != brothers.len)
			brother_text += ", "
	to_chat(owner.current, "<B><font size=3 color=red>You are the [owner.special_role] of [brother_text].</font></B>")
	to_chat(owner.current, "The Syndicate only accepts those that have proven themself. Prove yourself and prove your [team.member_name]s by completing your objectives together!")
	owner.announce_objectives()
	give_meeting_area()

/datum/antagonist/brother/proc/finalize_brother()
	procstart = null
	src.procstart = null
	SSticker.mode.update_brother_icons_added(owner)


/datum/objective_team/brother_team
	name = "brotherhood"
	member_name = "blood brother"
	var/meeting_area

/datum/objective_team/brother_team/is_solo()
	procstart = null
	src.procstart = null
	return FALSE

/datum/objective_team/brother_team/proc/update_name()
	procstart = null
	src.procstart = null
	var/list/last_names = list()
	for(var/datum/mind/M in members)
		var/list/split_name = splittext(M.name," ")
		last_names += split_name[split_name.len]

	name = last_names.Join(" & ")

/datum/objective_team/brother_team/roundend_report()
	procstart = null
	src.procstart = null
	var/list/parts = list()

	parts += "<span class='header'>The blood brothers of [name] were:</span>"
	for(var/datum/mind/M in members)
		parts += printplayer(M)
	var/win = TRUE
	var/objective_count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.check_completion())
			parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] <span class='greentext'><B>Success!</span>"
		else
			parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
			win = FALSE
		objective_count++
	if(win)
		parts += "<span class='greentext'>The blood brothers were successful!</span>"
	else
		parts += "<span class='redtext'>The blood brothers have failed!</span>"

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/objective_team/brother_team/proc/add_objective(datum/objective/O, needs_target = FALSE)
	procstart = null
	src.procstart = null
	O.team = src
	if(needs_target)
		O.find_target()
	O.update_explanation_text()
	objectives += O

/datum/objective_team/brother_team/proc/forge_brother_objectives()
	procstart = null
	src.procstart = null
	objectives = list()
	var/is_hijacker = prob(10)
	for(var/i = 1 to max(1, CONFIG_GET(number/brother_objectives_amount) + (members.len > 2) - is_hijacker))
		forge_single_objective()
	if(is_hijacker)
		if(!locate(/datum/objective/hijack) in objectives)
			add_objective(new/datum/objective/hijack)
	else if(!locate(/datum/objective/escape) in objectives)
		add_objective(new/datum/objective/escape)

/datum/objective_team/brother_team/proc/forge_single_objective()
	procstart = null
	src.procstart = null
	if(prob(50))
		if(LAZYLEN(active_ais()) && prob(100/GLOB.joined_player_list.len))
			add_objective(new/datum/objective/destroy, TRUE)
		else if(prob(30))
			add_objective(new/datum/objective/maroon, TRUE)
		else
			add_objective(new/datum/objective/assassinate, TRUE)
	else
		add_objective(new/datum/objective/steal, TRUE)
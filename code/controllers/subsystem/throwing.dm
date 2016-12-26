#define MAX_THROWING_DIST 2048 // 8 z-levels on default width
#define MAX_TICKS_TO_MAKE_UP 2 //how many missed ticks will we attempt to make up for this run.
var/datum/subsystem/throwing/SSthrowing

/datum/subsystem/throwing
	name = "throwing"
	priority = 25
	wait = 1
	flags = SS_NO_INIT|SS_KEEP_TIMING|SS_TICKER

	var/list/currentrun
	var/list/processing

/datum/subsystem/throwing/New()
	NEW_SS_GLOBAL(SSthrowing)
	processing = list()


/datum/subsystem/throwing/stat_entry()
	..("P:[processing.len]")


/datum/subsystem/throwing/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(length(currentrun))
		var/atom/movable/AM = currentrun[currentrun.len]
		var/datum/thrownthing/TT = currentrun[AM]
		currentrun.len--
		if (!AM || !TT)
			processing -= AM
			if (MC_TICK_CHECK)
				return
			continue
		TT.tick()
		if (paused || MC_TICK_CHECK)
			return
	currentrun = null

/datum/thrownthing
	var/atom/movable/thrownthing
	var/atom/target
	var/turf/target_turf
	var/init_dir
	var/maxrange
	var/speed
	var/mob/thrower
	var/diagonals_first
	var/dist_travelled = 0
	var/start_time
	var/dist_x
	var/dist_y
	var/dx
	var/dy
	var/pure_diagonal
	var/diagonal_error
	var/datum/callback/callback

/datum/thrownthing/proc/tick()
	if (!isturf(thrownthing.loc) || !thrownthing.throwing)
		finialize()
		return

	if (dist_travelled && hitcheck()) //to catch sneaky things moving on our tile while we slept
		finialize()
		return

	var/atom/step
	//calculate how many tiles to move, making up for any missed ticks.
	var/tilestomove = round(min((((world.time - start_time) * speed) - (dist_travelled ? dist_travelled : -1)), speed*MAX_TICKS_TO_MAKE_UP) * (world.tick_lag * SSthrowing.wait))
	while (tilestomove-- > 0)
		if ((dist_travelled >= maxrange || thrownthing.loc == target_turf) && thrownthing.has_gravity(thrownthing.loc))
			finialize(hit = FALSE)
			return
		if (dist_travelled < max(dist_x, dist_y)) //if we haven't reached the target yet we home in on it, otherwise we use the initial direction
			step = get_step(thrownthing, get_dir(thrownthing, target_turf))
		else
			step = get_step(thrownthing, init_dir)

		if (!pure_diagonal && !diagonals_first) // not a purely diagonal trajectory and we don't want all diagonal moves to be done first
			if (diagonal_error >= 0 && max(dist_x,dist_y) - dist_travelled != 1) //we do a step forward unless we're right before the target
				step = get_step(thrownthing, dx)
			diagonal_error += (diagonal_error < 0) ? dist_x/2 : -dist_y
		if (!step) // going off the edge of the map makes get_step return null, don't let things go off the edge
			finialize(hit = FALSE)
			return
		thrownthing.Move(step, get_dir(thrownthing, step))
		if (!thrownthing.throwing) // we hit something during our move
			finialize()
			return
		dist_travelled++

		if (dist_travelled > MAX_THROWING_DIST)
			finialize(hit = FALSE)
			return
		if (world.tick_usage > CURRENT_TICKLIMIT)
			return

/datum/thrownthing/proc/finialize(hit = TRUE)
	set waitfor = 0
	SSthrowing.processing -= thrownthing
	//done throwing, either because it hit something or it finished moving
	thrownthing.throwing = 0
	if (!hit)
		for (var/thing in get_turf(thrownthing)) //looking for our target on the turf we land on.
			var/atom/A = thing
			if (A == target)
				hit = 1
				thrownthing.throw_impact(A)
				break
		if (!hit)
			thrownthing.throw_impact(get_turf(thrownthing))  // we haven't hit something yet and we still must, let's hit the ground.
			thrownthing.newtonian_move(init_dir)
	else
		thrownthing.newtonian_move(init_dir)
	if (callback)
		callback.Invoke()

/datum/thrownthing/proc/hitcheck()
	for (var/thing in get_turf(thrownthing))
		var/atom/movable/AM = thing
		if (AM == thrownthing)
			continue
		if (AM.density && !(AM.pass_flags & LETPASSTHROW) && !(AM.flags & ON_BORDER))
			thrownthing.throwing = 0
			thrownthing.throw_impact(AM)
			return 1

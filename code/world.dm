/world
	mob = /mob/dead/observer
	view = "17x17"

	turf = /turf/space
	area = /area/space
	cache_lifespan = 0 //stops player uploaded stuff from being kept in the rsc past the current session

world/proc/timestamp()
	return world.timeofday

/* Old code that I didn't bother deleting from Encrypted

	New()
		spawn(10) src.process()
		..()
	proc/process()
		for(var/turf/T in world)
			if(!T.density)
				T.process()
		for(var/mob/M in world)
			var/turf/T = M.loc
			if(T.oxy >= 0.5)
				T.oxy -= 0.5
				T.carb += 0.5
			else
				M.suffocate()
		spawn() src.process()
*/

/world/New()
	//logs

/*
	var/date_string = time2text(world.realtime, "YYYY/MM-Month/DD-Day")
	href_logfile = file("data/logs/[date_string] hrefs.htm")
	diary = file("data/logs/[date_string].log")
	diaryofmeanpeople = file("data/logs/[date_string] Attack.log")
	diary << "\n\nStarting up. [time2text(world.timeofday, "hh:mm.ss")]\n---------------------"
	diaryofmeanpeople << "\n\nStarting up. [time2text(world.timeofday, "hh:mm.ss")]\n---------------------"
*/

	if(byond_version < RECOMMENDED_VERSION)
		world.log << "Your server's byond version does not meet the recommended requirements for this code. Please update BYOND"

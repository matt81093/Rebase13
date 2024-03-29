//Thank Paradise and VG for these commits
//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.

/client/verb/wiki(query as text)
	set name = "wiki"
	set desc = "Type what you want to know about.  This will open the wiki on your web browser."
	set hidden = 1
	if(config.wikiurl)
		if(query)
			var/output = config.wikiurl + "/index.php?title=Special%3ASearch&profile=default&search=" + query
			src << link(output)
		else
			src << link(config.wikiurl)
	else
		src << "<span class='danger'>The wiki URL is not set in the server configuration.</span>"
	return

/client/verb/forum()
	set name = "forum"
	set desc = "Visit the forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.forumurl)
	else
		src << "<span class='danger'>The forum URL is not set in the server configuration.</span>"
	return

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse(file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE




/client/verb/MapRender()
	set name = "MapRender"
	set desc = "Shows a high scale rendering of the current map in your browser."
	set hidden = 1

	if(!config.renders_url || config.renders_url == "")
		src << "<span class='danger'>The Map Renders url has not been set in the server configuration.</span>"
		return
	if(alert("This will open the map render(s) in your browser. Are you sure?",,"Yes","No")=="No")
		return
	if(map)
		switch(map.nameShort)
			if("meta")
				src << link("[config.renders_url]/metaclub/")
			if("deff")
				src << link("[config.renders_url]/defficiency/")
			if("box")
				src << link("[config.renders_url]/tgstation/")
			if("taxi")
				src << link("[config.renders_url]/taxistation/")
			else
				src << "<span class='warning'>No map render for [map.nameLong], bug Pomf about it!</span>"
	return






/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = drop
\te = equip
\tr = throw
\tm = me
\tt = say
\to = OOC
\tx = swap-hand
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+x = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP = swap-hand
\tPGDN = activate held object
\tEND = throw
</font>"}

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin
</font>"}

	src << hotkey_mode
	src << other
	if(holder)
		src << admin

// Needed to circumvent a bug where .winset does not work when used on the window.on-size event in skins.
// Used by /datum/html_interface/nanotrasen (code/modules/html_interface/nanotrasen/nanotrasen.dm)
/client/verb/_swinset(var/x as text)
	set name = ".swinset"
	set hidden = 1
	winset(src, null, x)

/client/verb/roundendinfo()
	set name = "RoundEndInformation"
	set desc = "Open the Round End Information window."
	set hidden = 1

	src << browse(round_end_info, "window=roundstats;size=1000x600")

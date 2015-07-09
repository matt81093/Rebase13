/* This file is meant to help configure variables set elsewhere, easier. */
//Use Variable if you need to set the variable in-game, and defines if you don't.
// Set URL's used by the "forum", "wiki", ect tabs respectively
#define _wikiurl "http://baystation12.net/wiki"
#define _forumurl "http://baystation12.net/forums/"

#define _mediabaseurl "http://nanotrasen.se/media" // http://ss13.nexisonline.net/media







var/datum/configuration/config = null


var/host = null
var/join_motd = null
var/station_name = "NSS Cyberiad"
var/game_version = "Custom ParaCode"
var/changelog_hash = ""
var/game_year = (text2num(time2text(world.realtime, "YYYY")) + 544)



/datum/configuration

	var/wikiurl = _wikiurl
	var/forumurl = _forumurl

	var/media_base_url = _mediabaseurl
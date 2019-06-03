# Infocom's Planetfall, modernized

Planetfall is a 1983 interactive fiction game written by Steve Meretzky and published by Infocom.

Further information on Planetfall:

* [Wikipedia](https://en.wikipedia.org/wiki/Planetfall)
* [The Digital Antiquarian](https://www.filfre.net/2013/03/planetfall/)
* [The Interactive Fiction Database](https://ifdb.tads.org/viewgame?id=xe6kb3cuqwie2q38)
* [The Infocom Gallery](http://infocom.elsewhere.org/gallery/planetfall/planetfall.html)
* [IFWiki](http://www.ifwiki.org/index.php/Planetfall)

__What is this Repository?__

This repository is a modification of the original Planetfall source code, with the goal to make it more playable by a modern audience with some minor tweaks and all known bugs fixed.

__Overview of Changes__

CLASSIC allows the player to take advantage of the bug fixes while still playing the game as it was intended.
MODERN allows the player to enjoy the game without having to worry about unfair deaths or hunger.

* addition of CLASSIC and MODERN pseudo-verbs
* bug fixes (in progress)
* spelling corrections (done)
* removal of need to eat for MODERN mode (done)
* removal of some egregious deaths in MODERN mode (in progress)
* removal of "walking deads" in MODERN mode (in progress)

__Bugs fixed__

* fixed sexlessness of ambassador and Blather when being shot (Cree #6)
* fixed switched off Floyd responding to things (Cree #7, Simpson #36)
* fixed behavior of water level as the days progress (Cree #8)
* prevented the pod from being opened from the webbing (Cree #9)
* fixed diary interfering with the elevator controls (Simpson #24)
* fixed "You're not holding the flask" when non-flask under spout (Simpson #25)
* fixed wearing uniform in carried container (Simpson #26)
* fixed some THROW/DROP HANDS bugs (Simpson #27)
* fixed DROP/THROW LITTLE BUTTON (gave button and dial PARTBIT) (Simpson #28)
* fixed PUT DIAL/LITTLE BUTTON UNDER SPOUT (Simpson #28)
* fixed GIVE LITTLE BUTTON TO FLOYD
* fixed DROP/THROW dial, goo and liquids (Simpson #28, #29, #30)
* fixed GIVE DIAL/GOO/FLUID/MEDICINE TO FLOYD (Simpson #28, #33)
* fixed EMPTY/SHAKE BOTTLE (Simpson #31)
* fixed medicine bottle bugs by making only the medicine fit inside (Simpson #32)
* prevented kitchen door from being manually closed (Simpson #35)
* fixed Floyd leaving closed rooms when seeing the breastplate (Simpson #37)
* fixed Floyd entering lab when not there (Simpson #37)
* Floyd reacts appropriately to SHOW PLATE TO FLOYD (Simpson #38)
* fixed dreaming of Floyd before meeting him (Simpson #39)
* fixed EMPTY X INTO Y (Simpson #40)
* fixed confusion with UNLOCK DOOR when padlock removed (Simpson #41)
* fixed error message when showing something to inanimate object (Simpson #42)
* fixed spool is/isn't on bed confusion (Simpson #43)
* fixed new battery having OBJECT adjective (Simpson #44)
* removed UPPER adjective from the blue door so that SLIDE UPPER THROUGH SLOT works

__To do list__

* Cree #10 is a tough one because it's pervasive (sleeping pauses timers etc). Some combo of delaying sleeping and killing the player should do it.
* Simpson #34 is also tough (FLOYD, PUSH RED [BUTTON]) because it's deep in the guts of the parser. Probably have to hack it...
* some more CLASSIC/MODERN modifications...?

Where appropriate, bugs taken from
* Graham Cree's list http://graeme.50webs.com/infobugs/planetfa.htm
* Nathan Simpson's list http://www.microheaven.com/InfocomBugs/planetfa.shtml

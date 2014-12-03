> **Note:** it is my intention to eventually include this as a fully-fledged github page to help acclimate potential Arma devs with sqf best practices code optimization.

As I've started to work on projects to extend the replayability of Arma, I have come to several conclusions:

1. Arma is a game that rewards those who can stomach an hour so of initial setup time
2. While there are pockets of individuals who hail from a technical background, much of the development community surrounding Arma (and FPS games in general) don't always articulate their discoveries through the same channels as other developers (read [GitHub](http://github.com).
3. The official [BIS wiki](https://community.bistudio.com/wiki/Main_Page) is an excellent resource, but a [required reading](#) list will help *alot* with limiting any time spent ramming one's head into a hard metaphorical surface. -- *I wasn't able to really appreciate the site until I found others referencing articles related to the core materials of sqf scripting really. Could be user error though ;)*

Therefore, I have started this collection of useful sqf scripts and guides, most of which I have streamlined and provided examples to.

> **Disclaimer:** please note that I am not the original author of many of the scripts discussed here. I do however modify, clean, or otherwise streamline the scripts extensively to ensure that I fully understand them during the corresponding discussion, and to ensure they integrate well with the my own scripts. Adding a little commonality does great things for helping people understand something abstract, and I've tried my best to ensure that the contents of this project are as accessible as possible.

> I've tried to acknowledge the original authors as I've found them, but if I've left you out, **please** drop me a message on [twitter](http://twitter.com/devynspencer) or my [blog](http://devynspencer.github.io), I'm happy to engage everyone, and I'll probably learn something from the encounter. ;) 

### overview

I've only recently started writing sqf scripts for Arma, and while it's been a fairly easy process, I've had trouble really hitting the ground running. I feel this could be improved for others with a few *quality* resources, and therefore I will be including a series of tutorial posts on my [blog](http://devynspencer.github.io).

As I use community scripts in my projects, I will post the cleaned up code here, along with documentation explaining the use of each script along with examples.

### further examples
These scripts are largely from resources I've used while working on sqf projects of my own. To see a "bigger picture" example of these concepts and scripts in action, check out my dynamic world generator [project](https://github.com/devynspencer/valkyrie).

### BIS functions
Unsure of where to start? Be sure to scrutinize the following official functions from BIS, as they add a ton of functionality and make scripting appear much less daunting (much of the *heavy lifting* of creating Arma projects has already been handled by BIS in one form or another, especially now that the series has built upon so many iterations):

* [BIS_fnc_param](https://community.bistudio.com/wiki/BIS_fnc_param) - input validation and set default values
* [BIS_fnc_3Dcredits](https://community.bistudio.com/wiki/BIS_fnc_3Dcredits)
* [BIS_fnc_infoText](https://community.bistudio.com/wiki/BIS_fnc_infoText)
* [BIS_fnc_saveGame](https://community.bistudio.com/wiki/BIS_fnc_saveGame)
* [BIS_fnc_AAN](https://community.bistudio.com/wiki/BIS_fnc_AAN)
* [BIS_fnc_inv](https://community.bistudio.com/wiki/BIS_fnc_inv)
* [BIS_fnc_sandstorm](https://community.bistudio.com/wiki/BIS_fnc_sandstorm)
* [BIS_fnc_crows](https://community.bistudio.com/wiki/BIS_fnc_crows)
* [BIS_fnc_invAdd](https://community.bistudio.com/wiki/BIS_fnc_invAdd)
* [BIS_fnc_selectRandom](https://community.bistudio.com/wiki/BIS_fnc_selectRandom)
* [BIS_fnc_customGPS](https://community.bistudio.com/wiki/BIS_fnc_customGPS)
* [BIS_fnc_invRemove](https://community.bistudio.com/wiki/BIS_fnc_invRemove)
* [BIS_fnc_spawnCrew](https://community.bistudio.com/wiki/BIS_fnc_spawnCrew)
* [BIS_fnc_customGPSvideo](https://community.bistudio.com/wiki/BIS_fnc_customGPSvideo)
* [BIS_fnc_invSlots](https://community.bistudio.com/wiki/BIS_fnc_invSlots)
* [BIS_fnc_spawnEnemy](https://community.bistudio.com/wiki/BIS_fnc_spawnEnemy)
* [BIS_fnc_destroyCity](https://community.bistudio.com/wiki/BIS_fnc_destroyCity)
* [BIS_fnc_invSlotsEmpty](https://community.bistudio.com/wiki/BIS_fnc_invSlotsEmpty)
* [BIS_fnc_spawnGroup](https://community.bistudio.com/wiki/BIS_fnc_spawnGroup)
* [BIS_fnc_dirIndicator](https://community.bistudio.com/wiki/BIS_fnc_dirIndicator)
* [BIS_fnc_invSlotType](https://community.bistudio.com/wiki/BIS_fnc_invSlotType)
* [BIS_fnc_spawnVehicle](https://community.bistudio.com/wiki/BIS_fnc_spawnVehicle)
* [BIS_fnc_dynamicText](https://community.bistudio.com/wiki/BIS_fnc_dynamicText)
* [BIS_fnc_invString](https://community.bistudio.com/wiki/BIS_fnc_invString)
* [BIS_fnc_spotter](https://community.bistudio.com/wiki/BIS_fnc_spotter)
* [BIS_fnc_findSafePos](https://community.bistudio.com/wiki/BIS_fnc_findSafePos)
* [BIS_fnc_isInFrontOf](https://community.bistudio.com/wiki/BIS_fnc_isInFrontOf)
* [BIS_fnc_supplydrop](https://community.bistudio.com/wiki/BIS_fnc_supplydrop)
* [BIS_fnc_flies](https://community.bistudio.com/wiki/BIS_fnc_flies)
* [BIS_fnc_locations](https://community.bistudio.com/wiki/BIS_fnc_locations)
* [BIS_fnc_taskAttack](https://community.bistudio.com/wiki/BIS_fnc_taskAttack)
* [BIS_fnc_halo](https://community.bistudio.com/wiki/BIS_fnc_halo)
* [BIS_fnc_music](https://community.bistudio.com/wiki/BIS_fnc_music)
* [BIS_fnc_taskDefend](https://community.bistudio.com/wiki/BIS_fnc_taskDefend)
* [BIS_fnc_help](https://community.bistudio.com/wiki/BIS_fnc_help)
* [BIS_fnc_playVideo](https://community.bistudio.com/wiki/BIS_fnc_playVideo)
* [BIS_fnc_taskPatrol](https://community.bistudio.com/wiki/BIS_fnc_taskPatrol)

Additionally, here are the built in commands I found most applicable:

* [setFog](https://community.bistudio.com/wiki/setFog)

### Support call-ins

Official BIS content:

* [Communications menu](https://community.bistudio.com/wiki/Arma_3_Communication_Menu)
* [Notifications](https://community.bistudio.com/wiki/Notification)
* [Add support link](https://community.bistudio.com/wiki/BIS_fnc_addSupportLink)
* [Limit available support calls](https://community.bistudio.com/wiki/BIS_fnc_limitSupport)

Other resources:

* [Forum thread](http://forums.bistudio.com/showthread.php?158314-Need-a-little-help-with-a-support-module) on interactions between support modules and sqf scripts

/obj/portal
	name = "portal"
	desc = "Looks unstable. Best to test it with the clown."
	icon = 'icons/obj/portals.dmi'
	icon_state = "portal"
	density = TRUE
	unacidable = TRUE
	var/obj/item/target = null
	var/creator = null
	anchored = TRUE
	var/dangerous = 0
	var/failchance = 0

/obj/portal/Bumped(mob/M as mob|obj)
	spawn(0)
		src.teleport(M)
		return
	return

/obj/portal/Crossed(AM as mob|obj)
	spawn(0)
		src.teleport(AM)
		return
	return

/obj/portal/attack_hand(mob/user as mob)
	spawn(0)
		src.teleport(user)
		return
	return

/obj/portal/New(start, end, delete_after = 300, failure_rate)
	..()
	if(failure_rate)
		failchance = failure_rate
		if(prob(failchance))
			icon_state = "portal1"
			dangerous = 1
	playsound(src, 'sound/effects/phasein.ogg', 25, 1)
	target = end

	if(delete_after)
		spawn(delete_after)
			qdel(src)

/obj/portal/Destroy()
	target = null
	. = ..()

/obj/portal/proc/teleport(atom/movable/M as mob|obj)
	if(istype(M, /obj/effect)) //sparks don't teleport
		return
	if (icon_state == "portal1")
		return
	if (!( target ))
		qdel(src)
		return
	if (ismovable(M))
		if(dangerous && prob(failchance)) //oh dear a problem, put em in deep space
			var/destination_z = GLOB.using_map.get_transit_zlevel(z)
			do_teleport(M, locate(rand(TRANSITIONEDGE, world.maxx - TRANSITIONEDGE), rand(TRANSITIONEDGE, world.maxy -TRANSITIONEDGE), destination_z), 0)
		else
			do_teleport(M, target, 1) ///You will appear adjacent to the beacon

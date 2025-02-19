GLOBAL_TYPED_NEW(physical_state, /datum/topic_state/physical)

/datum/topic_state/physical/can_use_topic(src_object, mob/user)
	. = user.shared_nano_interaction(src_object)
	if(. > STATUS_CLOSE)
		return min(., user.check_physical_distance(src_object))

/mob/proc/check_physical_distance(src_object)
	return STATUS_CLOSE

/mob/observer/ghost/check_physical_distance(src_object)
	return default_can_use_topic(src_object)

/mob/living/check_physical_distance(src_object)
	return loc ? loc.contents_nano_distance(src_object, src) : shared_living_nano_distance(src_object)

/mob/living/silicon/ai/check_physical_distance(src_object)
	return max(STATUS_UPDATE, shared_living_nano_distance(src_object))

GLOBAL_TYPED_NEW(physical_no_access_state, /datum/topic_state/physical/no_access)

/datum/topic_state/physical/no_access
	check_access = FALSE

/*
	This state checks that the src_object is the same the as user
*/
GLOBAL_TYPED_NEW(self_state, /datum/topic_state/self_state)

/datum/topic_state/self_state/can_use_topic(src_object, mob/user)
	if(src_object != user)
		return STATUS_CLOSE
	return user.self_can_use_topic(src_object)

/mob/proc/self_can_use_topic(src_object)
	return shared_nano_interaction()

/mob/observer/ghost/self_can_use_topic(src_object)
	return STATUS_INTERACTIVE

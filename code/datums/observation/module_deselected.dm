//	Observer Pattern Implementation: Module Deselected
//		Registration type: /mob/living/silicon/robot
//
//		Raised when: A robot deselects a module.
//
//		Arguments that the called proc should expect:
//			/mob/living/silicon/robot/robot:  The robot that deselected the module.
//			/obj/item/module:                 The deselected module.

GLOBAL_TYPED_NEW(module_deselected_event, /singleton/observ/module_deselected)

/singleton/observ/module_deselected
	name = "Module Deselected"
	expected_type = /mob/living/silicon/robot

/***************************
* Module Selected Handling *
***************************/

// Called from /mob/living/silicon/robot/proc/deselect_module
// in code/modules/mob/living/silicon/robot/inventory.dm

GLOBAL_TYPED_NEW(commandos, /datum/antagonist/deathsquad/mercenary)

/datum/antagonist/deathsquad/mercenary
	id = MODE_COMMANDO
	landmark_id = "Syndicate-Commando"
	role_text = "Syndicate Commando"
	role_text_plural = "Commandos"
	welcome_text = "You are in the employ of a criminal syndicate hostile to corporate interests."
	id_type = /obj/item/card/id/centcom/ERT
	flags = ANTAG_RANDOM_EXCEPTED

	hard_cap = 4
	hard_cap_round = 8
	initial_spawn_req = 4
	initial_spawn_target = 6
	faction = "commando"
	no_prior_faction = TRUE


/datum/antagonist/deathsquad/mercenary/equip(mob/living/carbon/human/player)

	player.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(player), slot_w_uniform)
	player.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat(player), slot_shoes)
	player.equip_to_slot_or_del(new /obj/item/clothing/glasses/thermal(player), slot_glasses)
	player.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/syndicate(player), slot_wear_mask)
	player.equip_to_slot_or_del(new /obj/item/storage/box(player), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/ammo_magazine/box/pistol(player), slot_in_backpack)
	player.equip_to_slot_or_del(new /obj/item/rig/merc(player), slot_back)
	player.equip_to_slot_or_del(new /obj/item/gun/energy/pulse_rifle(player), slot_r_hand)
	player.equip_to_slot_or_del(new /obj/item/melee/energy/sword(player), slot_l_hand)

	create_id("Commando", player)
	create_radio(SYND_FREQ, player)
	return 1

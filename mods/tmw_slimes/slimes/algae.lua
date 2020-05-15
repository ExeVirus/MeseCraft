mobs:register_mob("tmw_slimes:algae_slime", {
	group_attack = true,
	type = "animal",
	passive = false,
	attack_animals = false,
	attack_npcs = false,
	attack_monsters = false,
	attack_type = "dogfight",
	reach = 2,
	damage = tmw_slimes.weak_dmg,
	hp_min = 20,
	hp_max = 40,
	armor = 180,
	collisionbox = {-0.4, -0.02, -0.4, 0.4, 0.8, 0.4},
	visual_size = {x = 4, y = 4},
	visual = "mesh",
	mesh = "slime_liquid.b3d",
	blood_texture = "tmw_slime_goo.png^[colorize:"..tmw_slimes.colors["algae"],
	textures = {
		{"tmw_slime_goo_block.png^[colorize:"..tmw_slimes.colors["algae"],"tmw_slime_goo_block.png^[colorize:"..tmw_slimes.colors["algae"].."^[colorize:#FFF:96"},
	},
	sounds = {
		jump = "mobs_monster_slime_jump",
		attack = "mobs_monster_slime_attack",
		damage = "mobs_monster_slime_damage",
		death = "mobs_monster_slime_death",
	},
	makes_footstep_sound = false,
	walk_velocity = 0.5,
	run_velocity = 1.25,
	jump_height = 7,
	jump = true,
	view_range = 15,
	drops = {
		{name = "tmw_slimes:algae_goo", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 8,
	light_damage = 0,
	animation = {
		idle_start = 0,
		idle_end = 19,
		move_start = 21,
		move_end = 41,
		fall_start = 42,
		fall_end = 62,
		jump_start = 63,
		jump_end = 83
	},
	do_custom = function(self)
		tmw_slimes.animate(self)
		tmw_slimes.absorb_nearby_items(self)
	end,
	on_die = function(self, pos)
		tmw_slimes.drop_items(self, pos)
	end
})

minetest.override_item("tmw_slimes:algae_goo", {on_use = minetest.item_eat(2)})

mobs:spawn({
	name = "tmw_slimes:algae_slime",
	nodes = {
		"default:river_water_source","default:river_water_flowing",
	},
	min_light = 0,
	max_light = 16,
	chance = tmw_slimes.pervasive,
	active_object_count = tmw_slimes.pervasive_max,
	min_height = -31000,
	max_height = 200,
})

mobs:register_mob('mobs_creatures:halloween_ghost', {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 0,
	hp_min = 1,
	hp_max = 1,
	armor = 1,
	knock_back = false,
        collisionbox = {0.0,0.0,0.0, 0.0,0.0,0.0},
        visual = "mesh",
        mesh = "mobs_character.b3d",
        textures = {
                {"mobs_creatures_ghost.png"},
		{"mobs_creatures_ghost_murderous.png"},
        },
	blood_amount = 0,
	makes_footstep_sound = false,
	sounds = {
		random ="shadow_attack",
		 death = "shadow_hit",
	},
	walk_velocity = 1,
	run_velocity = 1,
	jump = true,
	fly = true,
	floats = true,
	suffocation = false,
	view_range = 16,
	drops = {
	{name = "halloween:suit_ghost", chance = 100, min = 1, max = 1},
        {name = "mobs_creatures:candycorn", chance = 4, min = 1, max = 2},
        {name = "mobs_creatures:caramel_apple", chance = 4, min = 1, max = 2},
        {name = "mobs_creatures:halloween_chocolate", chance = 4, min = 1, max = 2},
        {name = "mobs_creatures:lolipop", chance = 4, min = 1, max = 2},
        {name = "church_grave:grave", chance = 75, min = 1, max = 1},
	},
	lava_damage = 0,
	water_damage = 0,
	light_damage = 20,
	fall_damage = 0,
        animation = {
                speed_normal = 0,
                speed_run = 79,
                stand_start = 0,
                stand_end = 79,
                walk_start = 0,
                walk_end = 79,
                run_start = 0,
                run_end = 79,
                punch_start = 0,
                punch_end = 79,
        },
})

--Spawn Eggs
mobs:register_egg("mobs_creatures:halloween_ghost", "Halloween Ghost Spawn Egg", "wool_white.png", 1)

local date = os.date("*t")
if (date.month == 10 and date.day >= 20) or (date.month == 11 and date.day <= 3) then
	--Spawn Functions
	mobs:spawn_specific("mobs_creatures:halloween_ghost", {"group:cracky", "group:crumbly", "group:shovely", "group:pickaxey"}, {"air"}, 0, 6, 120, 2500, 12, -30912, 30912, false)
else
        return
end




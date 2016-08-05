-- a time between these values will be picked 
-- the AI will attempt to spawn after that time has passed
--values are in seconds
ao_ai_min_time = 300
ao_ai_max_time = 600

-- for each map this contains a list of sites
-- and for each site it contains the AI that should spawn there
-- for each site it also has a centre definition
-- sites will not spawn if a player is within the specified radius from this centre
ao_ai_data = {
	["rp_downtown_v4"] = {
		[1] = {
			[1]={
				["position"] = Vector(-784.14495849609,3260.3427734375,-195.96875),
				["angle"] = Angle(0,10.179443359375,0),
				["class"] = "PrisonShotgunner"
			},
			[2]={
				["position"] = Vector(-1150.6044921875,3271.2490234375,-195.52444458008),
				["angle"] = Angle(0,4.1594886779785,0),
				["class"] = "npc_combine_s"
			},
			[3]={
				["position"] = Vector(-1254.0020751953,3516.1264648438,-195.96875),
				["angle"] = Angle(0,-3.9807085990906,0),
				["class"] = "npc_combine_s"
			},
			[4]={
				["position"] = Vector(-1273.6245117188,4031.1018066406,-195.96875),
				["angle"] = Angle(0,-64.78059387207,0),
				["class"] = "npc_combine_s"
			},
			[5]={
				["position"] = Vector(-571.02313232422,4027.0532226563,-195.96875),
				["angle"] = Angle(0,-122.20053100586,0),
				["class"] = "npc_combine_s"
			},
			[6]={
				["position"] = Vector(-580.46057128906,3437.0661621094,-195.96875),
				["angle"] = Angle(0,142.2395324707,0),
				["class"] = "npc_combine_s"
			},
			[7]={
				["position"] = Vector(-982.81903076172,3757.4426269531,-195.96875),
				["angle"] = Angle(0,-40.66036605835,0),
				["class"] = "CombineElite"
			},
			["centre"] = Vector(-932.52191162109, 3583.314453125, -195.96875),
			["radius"] = 40
		},
		[2] = {
			[1]={
				["position"] = Vector(3196.3012695313, 4377.5825195313, 0.03125),
				["angle"] = Angle(0, -91.279975891113, 0),
				["class"] = "CombineElite"
			},
			[2]={
				["position"] = Vector(3450.5004882813, 4377.4829101563, 0.03125),
				["angle"] = Angle(0, -91.919937133789, 0),
				["class"] = "CombineElite"
			},
			[3]={
				["position"] = Vector(3449.7111816406, 4640.03125, -135.96875),
				["angle"] = Angle(0, 177.87985229492, 0),
				["class"] = "PrisonShotgunner"
			},
			[4]={
				["position"] = Vector(3204.5932617188, 4680.03125, -135.96875),
				["angle"] = Angle(0, 7.3000416755676, 0),
				["class"] = "PrisonShotgunner"
			},
			[5]={
				["position"] = Vector(3190.8046875, 4923.0551757813, 0.03125),
				["angle"] = Angle(0, -20.780960083008, 0),
				["class"] = "npc_metropolice"
			},
			[6]={
				["position"] = Vector(3170.1284179688, 4614.0971679688, 0.03125),
				["angle"] = Angle(0, 33.539047241211, 0),
				["class"] = "npc_metropolice"
			},
			[7]={
				["position"] = Vector(2878.1684570313, 4897.1591796875, 0.49960651993752),
				["angle"] = Angle(0, -26.080795288086, 0),
				["class"] = "ShotgunSoldier"
			},
			[8]={
				["position"] = Vector(2911.2043457031, 4586.1328125, 0.03125),
				["angle"] = Angle(0, 45.199111938477, 0),
				["class"] = "ShotgunSoldier"
			},
			[9]={
				["position"] = Vector(2628.4897460938, 4865.2377929688, 0.03125),
				["angle"] = Angle(0, -85.781028747559, 0),
				["class"] = "ShotgunSoldier"
			},
			[10]={
				["position"] = Vector(2714.3786621094, 4365.384765625, 0.03125),
				["angle"] = Angle(0, -82.261070251465, 0),
				["class"] = "npc_combine_s"
			},
			[11]={
				["position"] = Vector(2888.94140625, 4738.5146484375, -135.96875),
				["angle"] = Angle(0, -5.9405450820923, 0),
				["class"] = "CombinePrison"
			},
			["centre"] = Vector(3301.882080, 4642.284668, -270.298187),
			["radius"] = 75
		},
		[3] = {
			[1]={
				["position"] = Vector(5126.66796875, 3403.1728515625, -195.96875),
				["angle"] = Angle(0, -139.08111572266, 0),
				["class"] = "PrisonShotgunner"
			},
			[2]={
				["position"] = Vector(5133.7124023438, 3195.8603515625, -195.96875),
				["angle"] = Angle(0, 161.73870849609, 0),
				["class"] = "PrisonShotgunner"
			},
			[3]={
				["position"] = Vector(5132.3110351563, 3640.4155273438, -195.96875),
				["angle"] = Angle(0, -114.88164520264, 0),
				["class"] = "CombinePrison"
			},
			[4]={
				["position"] = Vector(5159.09765625, 3169.8386230469, -67.96875),
				["angle"] = Angle(0, -45.581451416016, 0),
				["class"] = "CombinePrison"
			},
			[5]={
				["position"] = Vector(5349.9350585938, 3596.4641113281, -195.96875),
				["angle"] = Angle(0, -89.88134765625, 0),
				["class"] = "CombineElite"
			},
			[6]={
				["position"] = Vector(5313.2705078125, 2821.5759277344, -195.96875),
				["angle"] = Angle(0, 110.09867858887, 0),
				["class"] = "npc_metropolice"
			},
			["centre"] = Vector(4933.9033203125, 3267.4001464844, -195.96875),
			["radius"] = 17
		},
		[4] = {
			[1]={
				["position"] = Vector(3732.0747070313, 2457.96875, -62.96875),
				["angle"] = Angle(0, 92.338920593262, 0),
				["class"] = "CombineElite"
			},
			[2]={
				["position"] = Vector(3339.2797851563, 2444.6457519531, -195.96875),
				["angle"] = Angle(0, 51.878524780273, 0),
				["class"] = "npc_metropolice"
			},
			[3]={
				["position"] = Vector(3736.70703125, 2369.9074707031, -195.96875),
				["angle"] = Angle(0, 112.49852752686, 0),
				["class"] = "ShotgunSoldier"
			},
			[4]={
				["position"] = Vector(3313.3935546875, 2028.5141601563, -195.96875),
				["angle"] = Angle(0, 65.338844299316, 0),
				["class"] = "CombinePrison"
			},
			[5]={
				["position"] = Vector(3705.7238769531, 2099.6811523438, -195.96875),
				["angle"] = Angle(0, 174.67892456055, 0),
				["class"] = "PrisonShotgunner"
			},
			[6]={
				["position"] = Vector(3744.9819335938, 2075.5583496094, -62.96875),
				["angle"] = Angle(0, 1.4589958190918, 0),
				["class"] = "npc_combine_s"
			},
			[7]={
				["position"] = Vector(3256.5051269531, 2373.0207519531, -62.96875),
				["angle"] = Angle(0, -48.340972900391, 0),
				["class"] = "ShotgunSoldier"
			},
			["centre"] = Vector(3474.6765136719, 2502.3828125, -195.96875),
			["radius"] = 50
		},
		[5] = {
			[1]={
				["position"] = Vector(2167.7077636719, 1759.4416503906, -195.96875),
				["angle"] = Angle(0, 175.39898681641, 0),
				["class"] = "PrisonShotgunner"
			},
			[2]={
				["position"] = Vector(2057.1433105469, 1765.07421875, -195.96875),
				["angle"] = Angle(0, 0.85911393165588, 0),
				["class"] = "ShotgunSoldier"
			},
			[3]={
				["position"] = Vector(2187.1225585938, 1670.0869140625, -67.96875),
				["angle"] = Angle(0, -116.19107055664, 0),
				["class"] = "CombineElite"
			},
			[4]={
				["position"] = Vector(2268.6865234375, 1124.6024169922, -195.96875),
				["angle"] = Angle(0, -134.57124328613, 0),
				["class"] = "npc_metropolice"
			},
			[5]={
				["position"] = Vector(2236.7961425781, 1488.8481445313, -195.96875),
				["angle"] = Angle(0, -141.72135925293, 0),
				["class"] = "npc_combine_s"
			},
			[6]={
				["position"] = Vector(2124.892578125, 1511.376953125, -195.96875),
				["angle"] = Angle(0, -85.951400756836, 0),
				["class"] = "CombinePrison"
			},
			["centre"] = Vector(2153.6369628906, 1433.0665283203, -195.96875),
			["radius"] = 25
		},
		[6] = {
			[1]={
				["position"] = Vector(2191.2097167969, 412.15533447266, -195.96875),
				["angle"] = Angle(0, 94.808700561523, 0),
				["class"] = "npc_metropolice"
			},
			[2]={
				["position"] = Vector(2303.7626953125, 415.1201171875, -195.96875),
				["angle"] = Angle(0, 91.508682250977, 0),
				["class"] = "npc_combine_s"
			},
			[3]={
				["position"] = Vector(2278.8115234375, 227.54901123047, -195.96875),
				["angle"] = Angle(0, 61.148685455322, 0),
				["class"] = "PrisonShotgunner"
			},
			[4]={
				["position"] = Vector(2460.2768554688, 286.52252197266, -71.96875),
				["angle"] = Angle(0, -110.2314453125, 0),
				["class"] = "ShotgunSoldier"
			},
			[5]={
				["position"] = Vector(2134.4509277344, 240.22512817383, -71.96875),
				["angle"] = Angle(0, -7.0514969825745, 0),
				["class"] = "CombinePrison"
			},
			[6]={
				["position"] = Vector(2291.6760253906, 431.96875, -71.96875),
				["angle"] = Angle(0, 90.848602294922, 0),
				["class"] = "CombineElite"
			},
			["centre"] = Vector(2292.23046875, 300.63525390625, -195.96875),
			["radius"] = 25
		},
		[7] = {
			[1]={
				["position"] = Vector(2535.1843261719, -2424.9006347656, -1.8234748840332),
				["angle"] = Angle(0, 89.428207397461, 0),
				["class"] = "npc_metropolice"
			},
			[2]={
				["position"] = Vector(2753.7778320313, -2424.96875, -1.8234748840332),
				["angle"] = Angle(0, 84.808349609375, 0),
				["class"] = "npc_combine_s"
			},
			[3]={
				["position"] = Vector(2627.1770019531, -2300.8552246094, -203.96875),
				["angle"] = Angle(0, 87.228149414063, 0),
				["class"] = "CombineElite"
			},
			[4]={
				["position"] = Vector(2479.4846191406, -2294.3869628906, -203.96875),
				["angle"] = Angle(0, 82.608123779297, 0),
				["class"] = "CombinePrison"
			},
			[5]={
				["position"] = Vector(2637.779296875, -2048.3608398438, -203.96875),
				["angle"] = Angle(0, 87.668151855469, 0),
				["class"] = "ShotgunSoldier"
			},
			[6]={
				["position"] = Vector(2782.1379394531, -2303.8654785156, -203.96875),
				["angle"] = Angle(0, 90.088165283203, 0),
				["class"] = "PrisonShotgunner"
			},
			["centre"] = Vector(2621.7373046875, -2197.3596191406, -203.96875),
			["radius"] = 60
		},
		[8] = {
			[1]={
				["position"] = Vector(490.703125, -1899.5157470703, -139.95639038086),
				["angle"] = Angle(0, 2.4478302001953, 0),
				["class"] = "CombineElite"
			},
			[2]={
				["position"] = Vector(890.90484619141, -2014.8797607422, -195.96875),
				["angle"] = Angle(0, 132.68780517578, 0),
				["class"] = "CombinePrison"
			},
			[3]={
				["position"] = Vector(858.63427734375, -1746.4281005859, -195.96875),
				["angle"] = Angle(0, -167.91249084473, 0),
				["class"] = "PrisonShotgunner"
			},
			[4]={
				["position"] = Vector(927.18627929688, -1617.6071777344, -195.96875),
				["angle"] = Angle(0, 90.667556762695, 0),
				["class"] = "ShotgunSoldier"
			},
			[5]={
				["position"] = Vector(1219.7145996094, -1618.7906494141, -195.96875),
				["angle"] = Angle(0, 158.64764404297, 0),
				["class"] = "ShotgunSoldier"
			},
			[6]={
				["position"] = Vector(828.57629394531, -1688.2376708984, -67.687553405762),
				["angle"] = Angle(0, -160.2121887207, 0),
				["class"] = "npc_metropolice"
			},
			["centre"] = Vector(653.10101318359, -1772.2071533203, -195.96875),
			["radius"] = 25
		},
		[9] = {
			[1]={
				["position"] = Vector(-97.996673583984, -6758.2314453125, 76.03125),
				["angle"] = Angle(0, 87.707870483398, 0),
				["class"] = "CombineElite"
			},
			[2]={
				["position"] = Vector(-376.67517089844, -6761.3676757813, 76.03125),
				["angle"] = Angle(0, 92.768058776855, 0),
				["class"] = "CombineElite"
			},
			[3]={
				["position"] = Vector(-376.48422241211, -6753.2392578125, -59.96875),
				["angle"] = Angle(0, 87.707939147949, 0),
				["class"] = "CombinePrison"
			},
			[4]={
				["position"] = Vector(-30.715908050537, -6745.7470703125, -59.96875),
				["angle"] = Angle(0, 98.488006591797, 0),
				["class"] = "CombinePrison"
			},
			[5]={
				["position"] = Vector(50.037784576416, -7205.4638671875, -59.96875),
				["angle"] = Angle(0, 174.74775695801, 0),
				["class"] = "ShotgunSoldier"
			},
			[6]={
				["position"] = Vector(-494.48565673828, -7207.4711914063, -59.96875),
				["angle"] = Angle(0, -0.89216315746307, 0),
				["class"] = "PrisonShotgunner"
			},
			["centre"] = Vector(-209.77062988281, -6996.1474609375, -195.32073974609),
			["radius"] = 75
		},
		[10] = {
			[1]={
				["position"] = Vector(-2433.96875, -6774.3623046875, -165.96875),
				["angle"] = Angle(0, 53.948505401611, 0),
				["class"] = "npc_combine_s"
			},
			[2]={
				["position"] = Vector(-2342.0104980469, -7277.0424804688, -165.96875),
				["angle"] = Angle(0, 88.48860168457, 0),
				["class"] = "PrisonShotgunner"
			},
			[3]={
				["position"] = Vector(-2641.4562988281, -7309.5693359375, -165.96875),
				["angle"] = Angle(0, 54.608551025391, 0),
				["class"] = "CombinePrison"
			},
			[4]={
				["position"] = Vector(-2992.7507324219, -6768.11328125, -165.96875),
				["angle"] = Angle(0, -21.291812896729, 0),
				["class"] = "npc_metropolice"
			},
			[5]={
				["position"] = Vector(-2959.1801757813, -7290.962890625, -165.96875),
				["angle"] = Angle(0, 45.808109283447, 0),
				["class"] = "CombineElite"
			},
			[6]={
				["position"] = Vector(-2749.4665527344, -7314.2895507813, -165.96875),
				["angle"] = Angle(0, 93.108184814453, 0),
				["class"] = "ShotgunSoldier"
			},
			["centre"] = Vector(-2589.1787109375, -6893.4174804688, -165.96875),
			["radius"] = 60
		},
		[11] = {
			[1]={
				["position"] = Vector(535.32189941406, 3666.6645507813, -39.96875),
				["angle"] = Angle(0, 133.64797973633, 0),
				["class"] = "CombineElite"
			},
			[2]={
				["position"] = Vector(1368.03125, 2775.96875, -39.96875),
				["angle"] = Angle(0, 165.248046875, 0),
				["class"] = "npc_combine_s"
			},
			[3]={
				["position"] = Vector(1317.3260498047, 2946.248046875, -39.96875),
				["angle"] = Angle(0, -71.551460266113, 0),
				["class"] = "PrisonShotgunner"
			},
			[4]={
				["position"] = Vector(1156.0496826172, 3021.3112792969, -39.96875),
				["angle"] = Angle(0, -89.59196472168, 0),
				["class"] = "npc_metropolice"
			},
			[5]={
				["position"] = Vector(545.84191894531, 3156.9287109375, -39.96875),
				["angle"] = Angle(0, -7.0919380187988, 0),
				["class"] = "CombinePrison"
			},
			[6]={
				["position"] = Vector(1114.4755859375, 3324.2248535156, -39.96875),
				["angle"] = Angle(0, -116.87196350098, 0),
				["class"] = "npc_combine_s"
			},
			[7]={
				["position"] = Vector(1497.8483886719, 3397.3967285156, -39.96875),
				["angle"] = Angle(0, -116.51163482666, 0),
				["class"] = "CombineElite"
			},
			[8]={
				["position"] = Vector(1272.6846923828, 3424.4140625, -39.96875),
				["angle"] = Angle(0, -84.611640930176, 0),
				["class"] = "PrisonShotgunner"
			},
			["centre"] = Vector(940.17303466797, 3271.7873535156, -39.96875),
			["radius"] = 50
		},
	}
}

-- map ai class to a weapon type
ao_ai_weapon_data = {
	["npc_combine_s"] = "weapon_smg1",
	["ShotgunSoldier"] = "weapon_shotgun",
	["CombineElite"] = "weapon_ar2",
	["CombinePrison"] = "weapon_smg1",
	["PrisonShotgunner"] = "weapon_shotgun",
	["npc_metropolice"] = "weapon_smg1"
}
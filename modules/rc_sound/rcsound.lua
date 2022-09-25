SOUNDS_CONFIG = {
    soundChannel = SoundChannels.Music,
    checkInterval = 500,
    folder = 'sounds/',
    noSound = 'No sound file for this area.',
}

SOUNDS = {
    --- Mi'hen City
    {fromPos = {x=1191, y=813, z=1}, toPos = {x=1402, y=981, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city
		{fromPos = {x=1212, y=830, z=7}, toPos = {x=1264, y=854, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city parche 1
		{fromPos = {x=1266, y=852, z=7}, toPos = {x=1281, y=854, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city parche 2	
    {fromPos = {x=1218, y=833, z=7}, toPos = {x=1265, y=856, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city parche 3	
    {fromPos = {x=1266, y=854, z=7}, toPos = {x=1281, y=854, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city parche 3	
    {fromPos = {x=1213, y=977, z=7}, toPos = {x=1315, y=983, z=7}, priority = 1, sound="Mi'hen Highroad.ogg"}, 	----- mihen city parche 3	
    --- Exploring Default
		{fromPos = {x=717, y=629, z=1}, toPos = {x=1500, y=1430, z=7}, priority = 0, sound="Sprouting.ogg"}, ----- exploring
    --- Caves Default
    {fromPos = {x=717, y=629, z=8}, toPos = {x=1500, y=1430, z=15}, priority = 1, sound="Scorching Desert.ogg"},  ------ cave 
    --- Kilika Depot
    {fromPos = {x=975, y=961, z=1}, toPos = {x=991, y=982, z=6}, priority = 2, sound="Travel Company.ogg"},   ----- depot kilika	
    --- Kilika Temple & TP Roonm
    {fromPos = {x=1007, y=967, z=1}, toPos = {x=1027, y=986, z=7}, priority = 2, sound="The Sight of Spira.ogg"}, ------- temple
		{fromPos = {x=1014, y=976, z=8}, toPos = {x=1031, y=988, z=8}, priority = 2, sound="The Sight of Spira.ogg"}, ------- temple
    {fromPos = {x=151, y=627, z=8}, toPos = {x=218, y=696, z=9}, priority = 2, sound="The Sight of Spira.ogg"}, ------- tps
    --- Training
    {fromPos = {x=153, y=463, z=1}, toPos = {x=242, y=620, z=15}, priority = 2, sound="Darkness.ogg"},	------- trainer
    --- Mi'hen Depot & Boat
    {fromPos = {x=1232, y=912, z=1}, toPos = {x=1259, y=931, z=7}, priority = 2, sound="Travel Company.ogg"}, ------- depot mihen
    		{fromPos = {x=1319, y=962, z=6}, toPos = {x=1353, y=979, z=6}, priority = 2, sound="Travel Company.ogg"}, ------- mihen boat
    --- Mi'hen Temple & TP Room
    {fromPos = {x=1233, y=865, z=3}, toPos = {x=1247, y=880, z=7}, priority = 2, sound="The Sight of Spira.ogg"},  ------- temple mihen
    {fromPos = {x=1246, y=866, z=6}, toPos = {x=1270, y=876, z=6}, priority = 2, sound="The Sight of Spira.ogg"},  ------- temple mihen
    {fromPos = {x=1236, y=873, z=8}, toPos = {x=1241, y=876, z=8}, priority = 2, sound="The Sight of Spira.ogg"},  ------- temple mihen      
    {fromPos = {x=236, y=639, z=8}, toPos = {x=282, y=678, z=9}, priority = 2, sound="The Sight of Spira.ogg"},  ------- tps
    --- Roshamuul Grounds
    {fromPos = {x=1187, y=1056, z=1}, toPos = {x=1399, y=1181, z=7}, priority = 2, sound="Mi'hen Highroad.ogg"},  ----- roshamuul
    {fromPos = {x=1211, y=1043, z=7}, toPos = {x=1285, y=1055, z=7}, priority = 2, sound="Mi'hen Highroad.ogg"},  ----- roshamuul
    {fromPos = {x=1321, y=1048, z=1}, toPos = {x=1396, y=1081, z=7}, priority = 2, sound="Mi'hen Highroad.ogg"},  ----- roshamuul
    --- Hunting Areas (Illusion)
    {fromPos = {x=1143, y=974, z=1}, toPos = {x=1204, y=1020, z=5}, priority = 2, sound="Illusion.ogg"}, 	----- dragon kilika
		{fromPos = {x=1121, y=1018, z=1}, toPos = {x=1161, y=1041, z=5}, priority = 2, sound="Illusion.ogg"}, 	----- dragon parte 2
		{fromPos = {x=1139, y=1004, z=5}, toPos = {x=1141, y=1009, z=5}, priority = 2, sound="Illusion.ogg"}, 	----- dragon parche piso 5
		{fromPos = {x=1175, y=1002, z=6}, toPos = {x=1191, y=1009, z=6}, priority = 2, sound="Illusion.ogg"}, 	----- dragon kilika parche
		{fromPos = {x=1223, y=984, z=1}, toPos = {x=1389, y=1063, z=7}, priority = 2, sound="Illusion.ogg"}, 	----- mino mihen
    {fromPos = {x=1065, y=804, z=7}, toPos = {x=1366, y=854, z=7}, priority = 3, sound="Illusion.ogg"}, 	----- mihen hill north
		{fromPos = {x=980, y=1010, z=7}, toPos = {x=1109, y=1111, z=7}, priority = 3, sound="Illusion.ogg"}, 	----- bikanel desert
    {fromPos = {x=830, y=959, z=7}, toPos = {x=942, y=1007, z=7}, priority = 3, sound="Illusion.ogg"}, 	----- krailos beach
    --- Hunting Areas (Darkness)
    {fromPos = {x=964, y=937, z=12}, toPos = {x=1054, y=1018, z=15}, priority = 2, sound="Darkness.ogg"},  ------ fury
    {fromPos = {x=915, y=719, z=12}, toPos = {x=1091, y=898, z=15}, priority = 2, sound="Darkness.ogg"}, 	----- warlocks	
		{fromPos = {x=912, y=1100, z=13}, toPos = {x=1044, y=1192, z=15}, priority = 2, sound="Darkness.ogg"}, 	----- warlocks	
		{fromPos = {x=686, y=932, z=9}, toPos = {x=827, y=1069, z=9}, priority = 2, sound="Darkness.ogg"}, 	----- abandoned sewers
    --- Hunting Areas (Guadosalam)
    {fromPos = {x=1008, y=1022, z=11}, toPos = {x=1098, y=1087, z=13}, priority = 2, sound="Guadosalam.ogg"}, 	----- behemoth	
		{fromPos = {x=1101, y=999, z=10}, toPos = {x=1199, y=1087, z=15}, priority = 2, sound="Guadosalam.ogg"}, 	----- bog
		{fromPos = {x=1083, y=1102, z=10}, toPos = {x=1166, y=1150, z=13}, priority = 2, sound="Guadosalam.ogg"}, 	----- dwarf general
		{fromPos = {x=1040, y=1003, z=8}, toPos = {x=1060, y=1020, z=8}, priority = 2, sound="Guadosalam.ogg"}, 	----- dwarf entrada
	  {fromPos = {x=1045, y=1008, z=9}, toPos = {x=1092, y=1024, z=9}, priority = 2, sound="Guadosalam.ogg"}, 	----- dwarf floor -2
		{fromPos = {x=1083, y=1015, z=10}, toPos = {x=1100, y=1056, z=10}, priority = 2, sound="Guadosalam.ogg"}, 	----- dwarf floor -3
		--- Hunting Areas (Silence Before The Storm)
    {fromPos = {x=1053, y=840, z=1}, toPos = {x=1171, y=914, z=7}, priority = 2, sound="Silence Before The Storm.ogg"}, 	----- ice
		{fromPos = {x=1129, y=804, z=9}, toPos = {x=1254, y=864, z=9}, priority = 2, sound="Silence Before The Storm.ogg"}, 	----- ice
		{fromPos = {x=1128, y=849, z=8}, toPos = {x=1208, y=911, z=8}, priority = 2, sound="Silence Before The Storm.ogg"}, 	----- ice
		{fromPos = {x=1035, y=865, z=7}, toPos = {x=1060, y=907, z=7}, priority = 2, sound="Silence Before The Storm.ogg"}, 	----- ice
    {fromPos = {x=1044, y=804, z=7}, toPos = {x=1099, y=873, z=7}, priority = 2, sound="Silence Before The Storm.ogg"}, 	----- ice
    --- Hunting Areas (Riding The Shoopuff)
    {fromPos = {x=1287, y=854, z=7}, toPos = {x=1339, y=929, z=7}, priority = 2, sound="Riding The Shoopuff.ogg"}, 	----- cyclops mihen
		{fromPos = {x=1324, y=857, z=6}, toPos = {x=1334, y=877, z=6}, priority = 4, sound="Riding The Shoopuff.ogg"}, 	----- cyclops mihen parche 1
		{fromPos = {x=1323, y=856, z=5}, toPos = {x=1342, y=876, z=5}, priority = 4, sound="Riding The Shoopuff.ogg"}, 	----- cyclops mihen parche 2
		{fromPos = {x=1321, y=855, z=4}, toPos = {x=1327, y=858, z=4}, priority = 4, sound="Riding The Shoopuff.ogg"}, 	----- cyclops mihen parche 2
    --- Hunting Areas (Sprouting)
		{fromPos = {x=1085, y=908, z=6}, toPos = {x=1142, y=922, z=6}, priority = 3, sound="Sprouting.ogg"}, ----- stone golem
		--- Hunting Areas (Twilight)
		{fromPos = {x=1306, y=855, z=7}, toPos = {x=1309, y=859, z=7}, priority = 3, sound="Twilight.ogg"}, 	----- mihen wyrm lair entrada
		{fromPos = {x=1288, y=860, z=6}, toPos = {x=1341, y=926, z=6}, priority = 3, sound="Twilight.ogg"}, 	----- mihen wyrm lair piso 6
		{fromPos = {x=1291, y=867, z=5}, toPos = {x=1333, y=924, z=5}, priority = 3, sound="Twilight.ogg"}, 	----- mihen wyrm lair piso 5
		{fromPos = {x=1296, y=875, z=1}, toPos = {x=1331, y=921, z=4}, priority = 3, sound="Twilight.ogg"}, 	----- mihen wyrm lair piso 4
		{fromPos = {x=1312, y=845, z=9}, toPos = {x=1441, y=918, z=9}, priority = 3, sound="Twilight.ogg"}, 	----- elder wyrm piso -9
		{fromPos = {x=1325, y=856, z=8}, toPos = {x=1423, y=897, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- elder wyrm piso -8
		{fromPos = {x=1389, y=952, z=8}, toPos = {x=1425, y=991, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen peninsula
		{fromPos = {x=1424, y=973, z=8}, toPos = {x=1444, y=991, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen parche 1
		{fromPos = {x=1381, y=969, z=8}, toPos = {x=1404, y=982, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen parche 2
		{fromPos = {x=1462, y=979, z=8}, toPos = {x=1484, y=998, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen parche 3
	  {fromPos = {x=1394, y=961, z=9}, toPos = {x=1487, y=1025, z=9}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen piso -9
	  {fromPos = {x=1210, y=734, z=9}, toPos = {x=1269, y=790, z=9}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen norte -9
		{fromPos = {x=1214, y=737, z=10}, toPos = {x=1305, y=783, z=10}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen norte -10
		{fromPos = {x=1237, y=749, z=11}, toPos = {x=1261, y=784, z=11}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen norte -11
		{fromPos = {x=1224, y=776, z=12}, toPos = {x=1263, y=850, z=12}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen norte -12
		{fromPos = {x=1236, y=789, z=13}, toPos = {x=1249, y=804, z=13}, priority = 3, sound="Twilight.ogg"}, 	----- dragon mihen norte -13
	  {fromPos = {x=1078, y=890, z=8}, toPos = {x=1109, y=941, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior -8
		{fromPos = {x=1034, y=894, z=8}, toPos = {x=1078, y=914, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior parche 1
		{fromPos = {x=1039, y=915, z=8}, toPos = {x=1047, y=918, z=8}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior parche 2
		{fromPos = {x=1022, y=902, z=9}, toPos = {x=1050, y=921, z=9}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior -9
		{fromPos = {x=1034, y=905, z=10}, toPos = {x=1043, y=913, z=10}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior -10
		{fromPos = {x=1026, y=899, z=11}, toPos = {x=1048, y=919, z=12}, priority = 3, sound="Twilight.ogg"}, 	----- dragon kilika interior -11 -12
		--- Hunting Areas (Wandering Flame) 
		{fromPos = {x=1065, y=1080, z=8}, toPos = {x=1096, y=1106, z=8}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		{fromPos = {x=1062, y=1088, z=9}, toPos = {x=1086, y=1132, z=9}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		{fromPos = {x=1048, y=1120, z=9}, toPos = {x=1063, y=1199, z=9}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		{fromPos = {x=1036, y=1131, z=9}, toPos = {x=1048, y=1139, z=9}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		{fromPos = {x=979, y=1120, z=10}, toPos = {x=1061, y=1228, z=10}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		{fromPos = {x=959, y=1161, z=10}, toPos = {x=981, y=1180, z=10}, priority = 3, sound="Wandering Flame.ogg"}, 	----- bog raider
		--- Hunting Areas (Deceased Laugh)		
		{fromPos = {x=1096, y=1012, z=8}, toPos = {x=1203, y=1085, z=8}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- gs
		{fromPos = {x=1122, y=998, z=9}, toPos = {x=1205, y=1077, z=9}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- gs
		{fromPos = {x=1151, y=1075, z=9}, toPos = {x=1178, y=1086, z=9}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- gs	
		{fromPos = {x=1362, y=951, z=12}, toPos = {x=1399, y=1020, z=12}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- warwolf
    {fromPos = {x=1174, y=1005, z=7}, toPos = {x=1229, y=1053, z=7}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- demon oak
		{fromPos = {x=1344, y=856, z=1}, toPos = {x=1385, y=905, z=7}, priority = 3, sound="The Deceased Laugh.ogg"}, 	----- vengoth castle
    --- Hunting Areas (People of the North)	
		{fromPos = {x=673, y=849, z=10}, toPos = {x=911, y=996, z=10}, priority = 3, sound="People Of The North Pole.ogg"}, 	----- formorgar mines
		{fromPos = {x=822, y=870, z=11}, toPos = {x=891, y=936, z=11}, priority = 3, sound="People Of The North Pole.ogg"}, 	----- formorgar mines
		{fromPos = {x=839, y=874, z=12}, toPos = {x=883, y=928, z=12}, priority = 3, sound="People Of The North Pole.ogg"}, 	----- formorgar mines		
		--- Hunting Areas (Daughter Of The Great Summoner Warrior)
		{fromPos = {x=967, y=1068, z=9}, toPos = {x=1060, y=1119, z=9}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- quara
		{fromPos = {x=980, y=1120, z=9}, toPos = {x=1046, y=1129, z=9}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- quara
		{fromPos = {x=974, y=1130, z=9}, toPos = {x=1010, y=1143, z=9}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- quara
		{fromPos = {x=995, y=1066, z=9}, toPos = {x=1012, y=1084, z=9}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- quara
		{fromPos = {x=927, y=1098, z=9}, toPos = {x=982, y=1159, z=9}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- sea serpent
		{fromPos = {x=907, y=1104, z=10}, toPos = {x=979, y=1158, z=10}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- sea serpent
		{fromPos = {x=938, y=1074, z=8}, toPos = {x=991, y=1166, z=8}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- sea serpent
		{fromPos = {x=914, y=1105, z=8}, toPos = {x=943, y=1163, z=8}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- sea serpent
		{fromPos = {x=948, y=1194, z=11}, toPos = {x=1048, y=1224, z=11}, priority = 3, sound="Daughter Of The Great Summoner Warrior.ogg"}, 	----- underwater inquisition
		--- Hunting Areas (Hopeless Desire)
		{fromPos = {x=903, y=900, z=8}, toPos = {x=979, y=950, z=8}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- outlaw
		{fromPos = {x=951, y=867, z=8}, toPos = {x=1002, y=906, z=8}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- outlaw
		{fromPos = {x=900, y=900, z=9}, toPos = {x=963, y=944, z=9}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- outlaw
		{fromPos = {x=1042, y=951, z=8}, toPos = {x=1082, y=997, z=8}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1022, y=959, z=9}, toPos = {x=1092, y=995, z=9}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1035, y=976, z=10}, toPos = {x=1077, y=998, z=10}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1071, y=975, z=10}, toPos = {x=1113, y=1015, z=10}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1081, y=984, z=11}, toPos = {x=1112, y=1013, z=11}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1092, y=1007, z=9}, toPos = {x=1101, y=1016, z=9}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- hero
		{fromPos = {x=1016, y=960, z=10}, toPos = {x=1041, y=998, z=10}, priority = 3, sound="Hopeless Desire.ogg"}, 	----- inquisition room
		--- Hunting Areas (Djose Temple)
		{fromPos = {x=1163, y=968, z=11}, toPos = {x=1182, y=984, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- gs
		{fromPos = {x=1109, y=932, z=12}, toPos = {x=1246, y=986, z=12}, priority = 3, sound="Djose Temple.ogg"}, 	----- gs
		{fromPos = {x=1120, y=930, z=13}, toPos = {x=1257, y=989, z=13}, priority = 3, sound="Djose Temple.ogg"}, 	----- gs	
		------ Necromancer
		{fromPos = {x=961, y=788, z=10}, toPos = {x=1079, y=902, z=10}, priority = 3, sound="Djose Temple.ogg"}, 	----- necro chamber
		{fromPos = {x=964, y=785, z=11}, toPos = {x=1028, y=905, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- necro chamber
		{fromPos = {x=1027, y=849, z=11}, toPos = {x=1080, y=894, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- necro chamber
		{fromPos = {x=965, y=802, z=9}, toPos = {x=1030, y=903, z=9}, priority = 3, sound="Djose Temple.ogg"}, 	----- necro chamber
		------ Lich Hell
		{fromPos = {x=955, y=1040, z=11}, toPos = {x=1042, y=1087, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- lich
		{fromPos = {x=980, y=1085, z=11}, toPos = {x=1032, y=1100, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- lich
		{fromPos = {x=1010, y=1050, z=12}, toPos = {x=1042, y=1087, z=11}, priority = 3, sound="Djose Temple.ogg"}, 	----- lich
		{fromPos = {x=964, y=1046, z=13}, toPos = {x=1026, y=1093, z=13}, priority = 3, sound="Djose Temple.ogg"}, 	----- lich
		{fromPos = {x=928, y=1083, z=14}, toPos = {x=973, y=1107, z=14}, priority = 3, sound="Djose Temple.ogg"}, 	----- lich
		{fromPos = {x=1001, y=1043, z=14}, toPos = {x=1036, y=1068, z=15}, priority = 3, sound="Djose Temple.ogg"}, 	----- ungreez
    ------ PVP Arena
    {fromPos = {x=165, y=709, z=9}, toPos = {x=271, y=780, z=9}, priority = 3, sound="Hopeless Desire.ogg"}, 
} 


-- Sound
local rcSoundChannel
local showPosEvent
local playingSound


-- Design
soundWindow = nil
soundButton = nil


function toggle()
  if soundButton:isOn() then
    soundWindow:close()
    soundButton:setOn(false)
  else
    soundWindow:open()
    soundButton:setOn(true)
  end
end


function onMiniWindowClose()
  soundButton:setOn(false)
end


function init()
    for i = 1, #SOUNDS do
        SOUNDS[i].sound = SOUNDS_CONFIG.folder .. SOUNDS[i].sound
    end
    
    connect(g_game, { onGameStart = onGameStart,
                    onGameEnd = onGameEnd })
    
    rcSoundChannel = g_sounds.getChannel(SOUNDS_CONFIG.soundChannel)
    -- rcSoundChannel:setGain(value/COUNDS_CONFIG.volume)


    soundButton = modules.client_topmenu.addRightGameToggleButton('soundButton', tr('Sound Info') .. '', '/images/audio', toggle)
   soundButton:setOn(true)
    
   soundWindow = g_ui.loadUI('rcsound', modules.game_interface.getRightPanel())
   soundWindow:disableResize()
   soundWindow:setup()
    
    if(g_game.isOnline()) then
        onGameStart()
    end
end


function terminate()
    disconnect(g_game, { onGameStart = onGameStart,
                       onGameEnd = onGameEnd })
    onGameEnd()
    soundWindow:destroy()
    soundButton:destroy()
end


function onGameStart()
    stopSound()
    toggleSoundEvent = addEvent(toggleSound, SOUNDS_CONFIG.checkInterval)
end


function onGameEnd()
    stopSound()
    removeEvent(toggleSoundEvent)
end


function isInPos(pos, fromPos, toPos)
    return
        pos.x>=fromPos.x and
        pos.y>=fromPos.y and
        pos.z>=fromPos.z and
        pos.x<=toPos.x and
        pos.y<=toPos.y and
        pos.z<=toPos.z
end


function toggleSound()
    local player = g_game.getLocalPlayer()
    if not player then return end
    
    local pos = player:getPosition()
    local toPlay = nil


    for i = 1, #SOUNDS do
        if(isInPos(pos, SOUNDS[i].fromPos, SOUNDS[i].toPos)) then
            if(toPlay) then
                toPlay.priority = toPlay.priority or 0
                if((toPlay.sound~=SOUNDS[i].sound) and (SOUNDS[i].priority>toPlay.priority)) then
                    toPlay = SOUNDS[i]
                end
            else
                toPlay = SOUNDS[i]
            end
        end
    end


    playingSound = playingSound or {sound='', priority=0}
    
    if(toPlay~=nil and playingSound.sound~=toPlay.sound) then
        g_logger.info("RC Sounds: New sound area detected:")
        g_logger.info("  Position: {x=" .. pos.x .. ", y=" .. pos.y .. ", z=" .. pos.z .. "}")
        g_logger.info("  Music: " .. toPlay.sound)
        stopSound()
        playSound(toPlay.sound)
        playingSound = toPlay
    elseif(toPlay==nil) and (playingSound.sound~='') then
        g_logger.info("RC Sounds: New sound area detected:")
        g_logger.info("  Left music area.")
        stopSound()
    end


    toggleSoundEvent = scheduleEvent(toggleSound, SOUNDS_CONFIG.checkInterval)
end


function playSound(sound)
    rcSoundChannel:enqueue(sound, 0)
    setLabel(clearName(sound))
end


function clearName(soundName)
    local explode = string.explode(soundName, "/")
    soundName = explode[#explode]
    explode = string.explode(soundName, ".ogg")
    soundName = ''
    for i = 1, #explode-1 do
        soundName = soundName .. explode[i]
    end
    return soundName
end


function stopSound()
    setLabel(SOUNDS_CONFIG.noSound)
    rcSoundChannel:stop()
    playingSound = nil
end


function setLabel(str)
    soundWindow:recursiveGetChildById('currentSound'):getChildById('value'):setText(str)
end
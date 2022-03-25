local config = {
	waypointDirectory = "waypoints/",
}

local stop = false
local isAttacking = false
local isFollowing = false
local currentTargetPositionId = 1
local waypoints = {}
local autowalkTargetPosition = waypoints[currentTargetPositionId]
local itemHealingLoopId = nil
local hasLured = false
local player = nil
local healingItem 
local manaItem


function init()
	luniaBotWindow = g_ui.displayUI('luniabot')
	player = g_game.getLocalPlayer()
	waypointList = luniaBotWindow:getChildById("waypoints")
	luniaBotWindow:hide()
	luniaBotButton = modules.client_topmenu.addLeftGameButton('luniaBotButton', tr('Tasker'), 'icon', toggle)

	atkButton = luniaBotWindow:getChildById("autoAttack")
	walkButton = luniaBotWindow:getChildById("walking")
	healthSpellButton = luniaBotWindow:getChildById("AutoHealSpell")
	healthItemButton = luniaBotWindow:getChildById("AutoHealItem")
	manaRestoreButton = luniaBotWindow:getChildById("AutoMana")
	atkSpellButton = luniaBotWindow:getChildById("AtkSpell")
	manaTrainButton = luniaBotWindow:getChildById("ManaTrain")
	hasteButton = luniaBotWindow:getChildById("AutoHaste")
	buffButton = luniaBotWindow:getChildById("AutoBuff")
	lureButton = luniaBotWindow:getChildById("LureMonsters")
	manaShieldButton = luniaBotWindow:getChildById("AutoManaShield")
	antiIdleButton = luniaBotWindow:getChildById("AntiIdle")

	buttonEvent = {
		autoAttack =     {f = atkLoop,          e = nil },
		walking =        {f = walkToTarget,     e = nil },
		AutoHealSpell =  {f = healingSpellLoop, e = nil },
		AtkSpell =       {f = atkSpellLoop,     e = nil },
		ManaTrain =      {f = manaTrainLoop,    e = nil },
		AutoHaste =      {f = hasteLoop,        e = nil },
		AutoManaShield = {f = shieldLoop,       e = nil },
		AntiIdle =       {f = antiIdleLoop,     e = nil },
		AutoBuff =       {f = buffLoop,         e = nil }
	}

	healthItemButton.onCheckChange = autoHealPotion
	manaRestoreButton.onCheckChange = autoManaPotion

	luniaBotWindow:getChildById("AtkSpellText").onTextChange = saveBotText
	luniaBotWindow:getChildById("HealSpellText").onTextChange = saveBotText
	luniaBotWindow:getChildById("HealthSpellPercent").onTextChange = saveBotText
	luniaBotWindow:getChildById("HealItem").onTextChange = saveBotText
	luniaBotWindow:getChildById("HealItemPercent").onTextChange = saveBotText
	luniaBotWindow:getChildById("ManaItem").onTextChange = saveBotText
	luniaBotWindow:getChildById("ManaPercent").onTextChange = saveBotText
	luniaBotWindow:getChildById("WptName").onTextChange = saveBotText
	luniaBotWindow:getChildById("ManaSpellText").onTextChange = saveBotText
	luniaBotWindow:getChildById("ManaTrainPercent").onTextChange = saveBotText
	luniaBotWindow:getChildById("HasteText").onTextChange = saveBotText
	luniaBotWindow:getChildById("BuffText").onTextChange = saveBotText
	luniaBotWindow:getChildById("LureMinimum").onTextChange = saveBotText
	luniaBotWindow:getChildById("LureMaximum").onTextChange = saveBotText

	connect(g_game, { onGameStart = logIn, onGameEnd = logOut})
end


function saveBotText()
	g_settings.set(player:getName() .. " " .. luniaBotWindow:getFocusedChild():getId(), luniaBotWindow:getFocusedChild():getText())
end


function logIn()
	player = g_game.getLocalPlayer()
	print("Logged in as player: "..player:getName())

	-- Fixes default values
	if(luniaBotWindow:getChildById("HealItem"):getText()) == ",266" then
		luniaBotWindow:getChildById("HealItem"):setText('266')
	end
	
	if(luniaBotWindow:getChildById("ManaItem"):getText()) == ",268" then
		luniaBotWindow:getChildById("ManaItem"):setText('268')
	end

	local checkButtons = {atkButton, healthSpellButton, walkButton, healthItemButton, manaRestoreButton, atkSpellButton, manaTrainButton, hasteButton, manaShieldButton, antiIdleButton, buffButton, lureButton}
	for _,checkButton in ipairs(checkButtons) do
		checkButton:setChecked(g_settings.getBoolean(player:getName() .. " " .. checkButton:getId()))
	end

	local textBoxes = {luniaBotWindow.ManaSpellText, luniaBotWindow.HasteText, luniaBotWindow.AtkSpellText, luniaBotWindow.HealSpellText, luniaBotWindow.HealthSpellPercent, luniaBotWindow.HealItem, luniaBotWindow.HealItemPercent, luniaBotWindow.ManaItem, luniaBotWindow.ManaPercent, luniaBotWindow.WptName, luniaBotWindow.BuffText, luniaBotWindow.LureMinimum, luniaBotWindow.LureMaximum}
	for _,textBox in ipairs(textBoxes) do
		local storedText = g_settings.get(player:getName() .. " " .. textBox:getId())
		if string.len(storedText) >= 1 then
			textBox:setText(g_settings.get(player:getName() .. " " .. textBox:getId()))
		end
	end
end

function logOut()
	print("Logged out with player: "..player:getName())
	player = nil
end


function terminate()
	luniaBotWindow:destroy()
	luniaBotButton:destroy()
end


function disable()
	luniaBotButton:hide()
end


function hide()
	luniaBotWindow:hide()
end


function show()
	luniaBotWindow:show()
	luniaBotWindow:raise()
	luniaBotWindow:focus()
end


function toggleLoop(key)
	print("toggleLoop("..key..")")
	--maybe remove some looops, for example healing could be done through events
	local btn = luniaBotWindow:getChildById(key)
	local btn_id = btn:getId()
	if (btn:isChecked()) then
		g_settings.set(player:getName() .. " " .. btn:getId(), true)
		if buttonEvent[btn_id] then 
			print("Toggle Starting: "..key) 
			buttonEvent[btn_id]['e'] = scheduleEvent(buttonEvent[btn_id]['f'], 100) 
		end
	else
		g_settings.set(player:getName() .. " " .. btn:getId(), false)
		if buttonEvent[btn_id] then 
			print("Toggle Stopping: "..key) 
			removeEvent(buttonEvent[btn_id]['e']) 
		end
	end
end


function autoHealPotion()
	healingItem = healthItemButton:isChecked()
	g_settings.set(player:getName() .. " " .. healthItemButton:getId(), healthItemButton:isChecked())
	if (healingItem and itemHealingLoopId == nil) then
		itemHealingLoop()
	end
	if (not manaItem and not healingItem) then
		removeEvent(itemHealingLoopId)
		itemHealingLoopId = nil
	end
end


function autoManaPotion()
	manaItem = manaRestoreButton:isChecked()
	g_settings.set(player:getName() .. " " .. manaRestoreButton:getId(), manaRestoreButton:isChecked())
	if (manaItem and itemHealingLoopId == nil) then
		itemHealingLoop()
	end
	if (not manaItem and not healingItem) then
		removeEvent(itemHealingLoopId)
		itemHealingLoopId = nil
	end
end


function toggle()
	if luniaBotWindow:isVisible() then
		hide()
	else
		show()
	end
end


local function getDistanceBetween(p1, p2)
	return math.max(math.abs(p1.x - p2.x), math.abs(p1.y - p2.y))
end


function Player.canAttack(self)
	return not self:hasState(16384) and not g_game.isAttacking()
end


function Creature:canReach(creature)
	--function from candybot
	if not creature then
		return false
	end
	local myPos = self:getPosition()
	local otherPos = creature:getPosition()

	local neighbours = {
		{x = 0, y = -1, z = 0},
		{x = -1, y = -1, z = 0},
		{x = -1, y = 0, z = 0},
		{x = -1, y = 1, z = 0},
		{x = 0, y = 1, z = 0},
		{x = 1, y = 1, z = 0},
		{x = 1, y = 0, z = 0},
		{x = 1, y = -1, z = 0}
	}

	for k,v in pairs(neighbours) do
	local checkPos = {x = myPos.x + v.x, y = myPos.y + v.y, z = myPos.z + v.z}
	if postostring(otherPos) == postostring(checkPos) then
		return true
	end

	local steps, result = g_map.findPath(otherPos, checkPos, 40000, 0)
		if result == PathFindResults.Ok then
			return true
		end
	end
	return false
end


function atkLoop() 
	if not player or not buttonEvent['autoAttack']['e'] then print("autoAttack loop cancelled") return end
	
	if player:canAttack() then
		local pPos = player:getPosition()
		local luredMob = {}
		local lureAmount = tonumber(luniaBotWindow:getChildById("LureMaximum"):getText())
		local lureMinimum =  tonumber(luniaBotWindow:getChildById("LureMinimum"):getText())
		local luring = lureButton:isChecked()
		if pPos then --solves some weird bug, in the first login, the players position is nil in the start for some reason
			local creatures = g_map.getSpectators(pPos, false)
			if (luring) then
				for _, mob in ipairs(creatures) do
					cPos = mob:getPosition()
					if getDistanceBetween(pPos, cPos) <= 5 and mob:isMonster() and player:canReach(mob) then
						table.insert(luredMob, mob)
					end
				end
			end
			if (luring and #luredMob >= lureAmount) then
				hasLured = true
			end
			if (luring and #luredMob <= lureMinimum) then
				hasLured = false
			end
			for _, creature in ipairs(creatures) do
				cPos = creature:getPosition()
				if getDistanceBetween(pPos, cPos) <= 5 and creature:isMonster() and player:canReach(creature) then
					if (not luring or hasLured) then
						g_game.attack(creature)
						buttonEvent['autoAttack']['e'] = scheduleEvent(buttonEvent['autoAttack']['f'], 250)
						return
					end
				end
			end
		end
	end
	
	buttonEvent['autoAttack']['e'] = scheduleEvent(buttonEvent['autoAttack']['f'], 250)
end


function fag()
	local label = g_ui.createWidget('Waypoint', waypointList)
	local pos = player:getPosition()
	label:setText(pos.x .. "," .. pos.y .. "," .. pos.z)
	table.insert(waypoints, pos)
end


function walkToTarget()
	if not player or not buttonEvent['walking']['e'] then print("walking loop cancelled 1") return end

	--found this function made by gesior, i edited it abit, maybe there's better ways to walk? 
	autowalkTargetPosition = waypoints[currentTargetPositionId]

	local playerPos = player:getPosition()
	if (playerPos and autowalkTargetPosition) then
		if (getDistanceBetween(playerPos, autowalkTargetPosition) >= 150) then
			currentTargetPositionId = currentTargetPositionId + 1
			if (currentTargetPositionId > #waypoints) then
				currentTargetPositionId = 1
			end
			buttonEvent['walking']['e'] = scheduleEvent(buttonEvent['walking']['f'], 1500)
			return 
		end
	end

	if g_game.isAttacking() or isFollowing then
		buttonEvent['walking']['e'] = scheduleEvent(buttonEvent['walking']['f'], 300)
		return
	end

	if not autowalkTargetPosition then
		currentTargetPositionId = currentTargetPositionId + 1
		if (currentTargetPositionId > #waypoints) then
			currentTargetPositionId = 1
		end
		buttonEvent['walking']['e'] = scheduleEvent(buttonEvent['walking']['f'], 100)
		return
	end

	-- fast search path on minimap (known tiles)
	if not player or not buttonEvent['walking']['e'] then print("walking loop cancelled 2") return end
	steps, result = g_map.findPath(player:getPosition(), autowalkTargetPosition, 5000, 0)
	
	if result == PathFindResults.Ok then
		g_game.walk(steps[1], true)
	elseif result == PathFindResults.Position then
		currentTargetPositionId = currentTargetPositionId + 1
		if (currentTargetPositionId > #waypoints) then
			currentTargetPositionId = 1
		end
	else
		-- slow search path on minimap, if not found, start 'scanning' map
		if not player then return end
		steps, result = g_map.findPath(player:getPosition(), autowalkTargetPosition, 25000, 1)
		if result == PathFindResults.Ok then
			g_game.walk(steps[1], true)
		else
			-- can't reach?  so skip this waypoint. improve this somehow
			currentTargetPositionId = currentTargetPositionId + 1
		end
	end
	
	-- limit steps to 10 per second (100 ms between steps)
	local nextStep = math.max(100, player:getStepTicksLeft())
	buttonEvent['walking']['e'] = scheduleEvent(buttonEvent['walking']['f'], nextStep)
end


function saveWaypoints() 
	local saveText = '{\n'
	for _,v in pairs(waypoints) do
		saveText = saveText .. '{x = '.. v.x ..', y = ' .. v.y .. ', z = ' .. v.z .. '},\n'
	end
	saveText = saveText .. '}'
	local file = io.open(config.waypointDirectory .. luniaBotWindow:getChildById("WptName"):getText() .. ".lua", "w")
	file:write(saveText)
	file:close()
end


function loadWaypoints() 
	local f = io.open(config.waypointDirectory .. luniaBotWindow:getChildById("WptName"):getText() ..'.lua', "r")
	local content = f:read("*all")
	f:close()
	clearWaypoints()
	waypoints = loadstring("return "..content)()
	for _,v in ipairs(waypoints) do
		local labelt = g_ui.createWidget('Waypoint', waypointList)
		labelt:setText(v.x .. "," .. v.y .. "," .. v.z)
	end
end


function clearWaypoints()
	waypoints = {}
	autowalkTargetPosition = currentTargetPositionId
	autowalkTargetPosition = waypoints[currentTargetPositionId]
	clearLabels()
	walkButton:setChecked(false)
end


function clearLabels()
	while waypointList:getChildCount() > 0 do
		local child = waypointList:getLastChild()
		waypointList:destroyChildren(child)
	end
end


function itemHealingLoop()
	if not player then return end
	-- Prioritize healing item instead of mana
	if healingItem then
		local hpItemPercentage = tonumber(luniaBotWindow:getChildById("HealItemPercent"):getText())
		local hpItemId = tonumber(luniaBotWindow:getChildById("HealItem"):getText())
		if (player:getHealth() <= (player:getMaxHealth() * (hpItemPercentage/100))) then
			g_game.useInventoryItemWith(hpItemId, player)
			-- maybe don't try using mana after healing item?
		end
	end
	if manaItem then
		local manaItemPercentage = tonumber(luniaBotWindow.ManaPercent:getText())
		local manaItemId = tonumber(luniaBotWindow.ManaItem:getText())
		if (player:getMana() <= (player:getMaxMana() * (manaItemPercentage/100))) then
			g_game.useInventoryItemWith(manaItemId, player)
		end
	end
	itemHealingLoopId = scheduleEvent(itemHealingLoop, 250)
end


function healingSpellLoop()
	if not player or not buttonEvent['AutoHealSpell']['e'] then print("AutoHealSpell loop cancelled") return end

	local healingSpellPercentage = tonumber(luniaBotWindow:getChildById("HealthSpellPercent"):getText())
	local healSpell = luniaBotWindow:getChildById("HealSpellText"):getText()
	if (player:getHealth() <= (player:getMaxHealth() * (healingSpellPercentage/100))) then
		g_game.talk(healSpell)
	end
	
	buttonEvent['AutoHealSpell']['e'] = scheduleEvent(buttonEvent['AutoHealSpell']['f'], 502)
end


function manaTrainLoop()
	if not player or not buttonEvent['ManaTrain']['e'] then print("ManaTrain loop cancelled") return end

	local manaTrainPercentage = tonumber(luniaBotWindow:getChildById("ManaTrainPercent"):getText())
	local manaSpell = luniaBotWindow:getChildById("ManaSpellText"):getText()
	if (player:getMana() >= (player:getMaxMana() * (manaTrainPercentage/100))) then
		g_game.talk(manaSpell)
	end
	
	buttonEvent['ManaTrain']['e'] = scheduleEvent(buttonEvent['ManaTrain']['f'], 1000)
end


function hasteLoop()
	if not player or not buttonEvent['AutoHaste']['e'] then print("AutoHaste loop cancelled") return end

	local hasteSpell = luniaBotWindow:getChildById("HasteText"):getText()
	if (player:getHealth() >= (player:getMaxHealth() * (70/100))) then -- only cast when healthy
		if (not player:hasState(PlayerStates.Haste, player:getStates())) then
			g_game.talk(hasteSpell)
		end
	end

	buttonEvent['AutoHaste']['e'] = scheduleEvent(buttonEvent['AutoHaste']['f'], 1000)
end


function buffLoop()
	if not player or not buttonEvent['AutoBuff']['e'] then print("AutoBuff loop cancelled") return end

	local buffSpell = luniaBotWindow:getChildById("BuffText"):getText()
	if (not player:hasState(PlayerStates.PartyBuff, player:getStates())) then
		g_game.talk(buffSpell)
	end
	
	buttonEvent['AutoBuff']['e'] = scheduleEvent(buttonEvent['AutoBuff']['f'], 1000)
end


function shieldLoop()
	if not player or not buttonEvent['AutoManaShield']['e'] then print("AutoManaShield loop cancelled") return end

	if (not player:hasState(PlayerStates.ManaShield, player:getStates())) then
		g_game.talk('utamo vita')
	end

	buttonEvent['AutoManaShield']['e'] = scheduleEvent(buttonEvent['AutoManaShield']['f'], 1000)
end


function antiIdleTurnPlayer()
	if not player or not player:getPosition() then return end
	g_game.turn((player:getDirection() + 2) % 4)
end
function antiIdleLoop()
	if not player or not buttonEvent['AntiIdle']['e'] then print("AntiIdle loop cancelled") return end

	antiIdleTurnPlayer()
	scheduleEvent(antiIdleTurnPlayer, 200)
	local nextLoop = math.random(8, 14) * 60 * 1000
	--local nextLoop = math.random(2, 4) * 1000

	buttonEvent['AntiIdle']['e'] = scheduleEvent(buttonEvent['AntiIdle']['f'], nextLoop)
end


function atkSpellLoop()
	if not player or not buttonEvent['AtkSpell']['e'] then print("AtkSpell loop cancelled") return end

	local atkSpell = luniaBotWindow:getChildById("AtkSpellText"):getText()
	if (g_game.isAttacking()) then
		g_game.talk(atkSpell)
	end

	buttonEvent['AtkSpell']['e'] = scheduleEvent(buttonEvent['AtkSpell']['f'], 502)
end

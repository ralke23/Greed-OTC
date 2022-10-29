local areas = {
  {
    from = {x = 1235, y = 911, z = 7},
    to = {x = 1238, y = 911, z = 7},
    biome = "bloom"
  }
}

local window = nil
local nameLabel = nil
local fadeOutEvent = nil
local currentArea = ""

local smallAreas = {}
local bigAreas = {}

local function cacheArea(area)
  local width = area.to.x - area.from.x + 1
  local height = area.to.y - area.from.y + 1
  local depth = area.to.z - area.from.z + 1
  if width * height * depth > 1000 then
    return table.insert(bigAreas, area)
  end

  for x = area.from.x, area.to.x do
    for y = area.from.y, area.to.y do
      for z = area.from.z, area.to.z do
        -- we cannot guarantee its the same position table
        smallAreas["Position(" .. x .. "," .. y .. "," .. z .. ")"] = area
      end
    end
  end
end

function init()
  for _, area in ipairs(areas) do
    cacheArea(area)
  end
  
  connect(
    g_game,
    {
      onGameStart = create,
      onGameEnd = destroy
    }
  )

  if g_game.isOnline() then
    create()
  end
end

function create()
  --window = g_ui.loadUI("areas", modules.game_interface.getMapPanel())
  --window:setOpacity(0)
  --nameLabel = window:getChildById("name")

  connect(LocalPlayer, {onPositionChange = onPositionChange})
end

local function isInArea(position, fromPos, toPos)
  local x = position.x
  local y = position.y
  local z = position.z
  if z ~= fromPos.z and z ~= toPos.z then
    return false
  end

  if x >= fromPos.x and x <= toPos.x and y >= fromPos.y and y <= toPos.y then
    return true
  end

  return false
end

local function fadeOut()
  g_effects.fadeOut(window, 750)
  fadeOutEvent = nil
end

function onPositionChange(player, newPos, oldPos)
  local area = smallAreas["Position(" .. newPos.x .. "," .. newPos.y .. "," .. newPos.z .. ")"]
  if not area then
    for _, v in ipairs(bigAreas) do
      if isInArea(newPos, v.from, v.to) then area = v break end
    end
  end

  if not area or currentArea == area.name then
    return
  end

  currentArea = area.name
  print(area.name)
  --nameLabel:setText("Entering " .. area.name)
  --window:setWidth(nameLabel:getText():len() * 8)
  local map = modules.game_interface.getMapPanel()
  map:setMapShader(g_shaders.getShader(area.biome))
  --g_effects.fadeIn(window, 750)
  --if fadeOutEvent then
  --  removeEvent(fadeOutEvent)
  --end
  --fadeOutEvent = scheduleEvent(fadeOut, 1000)
end

function terminate()
  smallAreas = {}
  bigAreas = {}
  disconnect(
    g_game,
    {
      onGameStart = create,
      onGameEnd = destroy
    }
  )
  if window then
    destroy()
  end
end

function destroy()
  disconnect(LocalPlayer, {onPositionChange = onPositionChange})

  if window then
    window:destroy()
    window = nil
  end

  nameLabel = nil
  fadeOutEvent = nil
  currentArea = ""
end
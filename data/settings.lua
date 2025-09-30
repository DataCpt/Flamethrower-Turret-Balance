if mods["data-utils"] then require("__data-utils__.data.util") end

-- DU_DEBUG = true

-- from "__data-utils__.data.util"
local setting = mods["data-utils"] and setup_setting or function(name, default)
  if settings.startup[name] then
    if DU_DEBUG then log("Setting " .. name .. " to " .. tostring(settings.startup[name].value)) end
    return settings.startup[name].value
  else
    if DU_DEBUG then log("Setting: " .. name .. " not found; using default: " .. tostring(default)) end
    return default
  end
end

FTB_CONSUMPTION_MULTIPLIER = setting("ftb_consumption_multiplier", 4.0)
FTB_ALL_TURRETS = setting("ftb_all_turrets", false)

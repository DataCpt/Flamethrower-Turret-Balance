require("data.settings")
if mods["data-utils"] then require("__data-utils__.data.util") end

local function update_turret(turret)
  if not turret or not turret.attack_parameters or not turret.attack_parameters.fluid_consumption then return end
  if mods["data-utils"] then
    adjust_attr(turret, "attack_parameters.fluid_consumption", FTB_CONSUMPTION_MULTIPLIER)
  else
    turret.attack_parameters.fluid_consumption = turret.attack_parameters.fluid_consumption * FTB_CONSUMPTION_MULTIPLIER
    if DU_DEBUG then log("Flamethrower turret consumption increased to " .. turret.attack_parameters.fluid_consumption) end
  end
end

if not FTB_ALL_TURRETS then
  -- Default vanilla consumption: 0.2
  update_turret(data.raw["fluid-turret"]["flamethrower-turret"])
else
  for _, turret in pairs(data.raw["fluid-turret"]) do update_turret(turret) end
end

require("data.settings")

local turret = data.raw["fluid-turret"]["flamethrower-turret"]

if turret then
  -- Default vanilla consumption: 0.2
  turret.attack_parameters.fluid_consumption = 0.2 * FTB_CONSUMPTION_MULTIPLIER
  debug_log("Flamethrower turret consumption increased to " .. turret.attack_parameters.fluid_consumption)
end

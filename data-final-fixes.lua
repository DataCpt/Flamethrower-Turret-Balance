local turret = data.raw["fluid-turret"]["flamethrower-turret"]

local consumption_multiplier = settings.startup["ftb_consumption_multiplier"].value

if consumption_multiplier and turret then
  -- Default vanilla consumption: 0.2
  turret.attack_parameters.fluid_consumption = 0.2 * consumption_multiplier
  log("Flamethrower turret consumption increased to: " .. turret.attack_parameters.fluid_consumption)
end

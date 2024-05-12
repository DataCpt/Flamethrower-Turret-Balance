local turret = data.raw["fluid-turret"]["flamethrower-turret"]

if settings.startup["ftb_consumption_multiplier"].value and turret then
    -- Default vanilla consumption: 0.2
    turret.attack_parameters.fluid_consumption = 0.2 * settings.startup["ftb_consumption_multiplier"].value
    log("Flamethrower turret consumption increased to: " .. turret.attack_parameters.fluid_consumption)
end

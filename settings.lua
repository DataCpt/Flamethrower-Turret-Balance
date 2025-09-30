data:extend {{
  type = "double-setting",
  name = "ftb_consumption_multiplier",
  setting_type = "startup",
  default_value = 4.0,
  minimum_value = 1e-10,
  maximum_value = 1e+10,
  order = "a",
}, {
  type = "bool-setting",
  name = "ftb_all_turrets",
  setting_type = "startup",
  default_value = false,
  order = "b",
}}

DEBUG = true

function ensure_table(x) return type(x) == "table" and x[1] and x or {x} end

function log_table(tbl, indent)
  if not tbl or not ensure_table(tbl) then
    debug_log("Not a table")
    return
  end
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      debug_log(formatting)
      log_table(v, indent + 1)
    else
      debug_log(formatting .. tostring(v))
    end
  end
end

function contains_any_substring(name, substrings)
  for _, substring in ipairs(substrings) do
    if string.find(name, substring, 1, true) then return true end
  end
  return false
end

function debug_log(string) if DEBUG then log(string) end end

function setup_setting(name, default)
  if settings.startup[name] then
    debug_log("Setting " .. name .. " to " .. tostring(settings.startup[name].value))
    return settings.startup[name].value
  else
    debug_log("Setting: " .. name .. " not found; using default: " .. tostring(default))
    return default
  end
end

function setup_setting_options(name, default, options)
  if settings.startup[name] and
    (table.concat(options, ','):find(tostring(settings.startup[name].value)) ~= nil) then
    debug_log("Setting " .. name .. " to " .. tostring(settings.startup[name].value))
    return settings.startup[name].value
  else
    debug_log("Setting: " .. name .. " not found; using default: " .. tostring(default))
    return default
  end
end

function runtime_setting(name, default, event)
  if not game then return end
  local setting_value = settings.get_player_settings(event.player_index)[name].value
  if settings.get_player_settings(event.player_index)[name] then
    return settings.get_player_settings(event.player_index)[name].value
  else
    debug_log("Setting: " .. name .. " not found; using default: " .. tostring(default))
    return default
  end
end

function adjust_attr(table, key, mult, name, nodebug)
  if table[key] and mult ~= 1 then
    local init = table[key]
    table[key] = table[key] * mult
    local changed = (init < table[key]) and " increased" or " decreased"
    if not nodebug then
      debug_log(name .. " " .. key .. changed .. " from " .. init .. " to " .. table[key])
    end
  end
end

function set_attr(table, key, value, name, nodebug)
  if table and value then
    local init = table[key] or 0
    table[key] = value
    local changed = (init < table[key]) and " increased" or " decreased"
    if not nodebug then
      debug_log(name .. " " .. key .. changed .. " from " .. init .. " to " .. table[key])
    end
  end
end

function switch(value, cases, results)
  local casess = {}
  for i, v in ipairs(cases) do casess[v] = function() return results[i] end end
  if not casess[value] then return 0 end
  return (casess[value])()
end

function clamp(min, value, max) return math.max(min, math.min(max, value)) end

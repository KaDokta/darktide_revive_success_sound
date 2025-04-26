local mod = get_mod("ReviveSuccessSound")
mod.version = "1.0.0"

local InteractionSettings = mod:original_require("scripts/settings/interaction/interaction_settings")
local interaction_results = InteractionSettings.results
local debug = mod:get("enable_debug_mode")

mod:info("Loaded mod with version " .. mod.version .. ", debug: " .. tostring(debug))

local function is_myself(unit)
    return unit == Managers.player:local_player(1).player_unit
end

local function play_sound_on_revive(instance, result)
    if result ~= interaction_results.success then
        return
    end

    local unit = instance._interactor_unit

    if not unit or not is_myself(unit) then
        return
    end

    local type = instance:interaction_type() or ""
    if type == "pull_up" or type == "revive" or type == "remove_net" or type == "rescue" then
        if debug then
            mod:info("Playing sound...")
        end
        Managers.ui:play_2d_sound("wwise/events/player/play_device_auspex_scanner_minigame_progress_last")
    end
end

mod:hook(CLASS.PlayerInteracteeExtension, "stopped", function(func, instance, result, ...)
    mod:pcall(play_sound_on_revive, instance, result)
    func(instance, result, ...)
end)

mod.on_setting_changed = function()
    debug = mod:get("enable_debug_mode")
    mod:info("ReviveSuccessSound (" .. mod.version .. ") reloaded.")
end

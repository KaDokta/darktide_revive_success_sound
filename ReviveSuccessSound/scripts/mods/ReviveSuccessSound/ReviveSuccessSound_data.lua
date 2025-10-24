local mod = get_mod("ReviveSuccessSound")
return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "completion_sound",
                type = "dropdown",
                default_value = "wwise/events/player/play_device_auspex_scanner_minigame_progress_last",
                options = {
                    {
                        text = "option_one_minigame_progress_last",
                        value =
                        "wwise/events/player/play_device_auspex_scanner_minigame_progress_last"
                    },
                    {
                        text = "option_two_minigame_sinus",
                        value = "wwise/events/player/play_device_auspex_scanner_minigame_sinus_aligned"
                    },
                    {
                        text = "option_three_servo_skull",
                        value = "wwise/events/player/play_servitor_scanning_deploy"
                    }
                }
            },
            {
                setting_id = "enable_debug_mode",
                type = "checkbox",
                default_value = false,
            }
        }
    }
}

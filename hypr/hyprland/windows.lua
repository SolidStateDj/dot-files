--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Colours

local termColour = "rgb(73daca)"

hl.window_rule({
	name = "kitty-border",
	match = {
		class = "kitty",
	},
	border_color = termColour,
})
hl.window_rule({
	name = "alacritty-border",
	match = {
		class = "Alacritty",
	},
	border_color = termColour,
})

hl.window_rule({
	name = "cs2-tearing",
	match = {
		class = "cs2",
	},
	monitor = monitor_1,
	-- fullscreen = true,
	-- fullscreen_state = 3,
	immediate = true,
	content = "game",
})

-- Workspaces

hl.window_rule({ match = { class = "^(steam)$" }, workspace = "10" })
hl.window_rule({ match = { class = "^(org.mozilla.Thunderbird)$" }, workspace = "9" })
hl.window_rule({ match = { initial_title = "^(Discord)$" }, workspace = "2" })

-- Floating

hl.window_rule({ match = { class = "^(pavucontrol)$" }, float = true })
hl.window_rule({
	match = { class = "^(pavucontrol)$" },
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({ match = { class = "^(pavucontrol)$" }, center = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
})
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, center = true })

-- Layers
hl.layer_rule({
	name = "screenshots",
	match = { namespace = "selection" },
	no_anim = true,
})

hl.layer_rule({
	name = "waybar-blur",
	match = { namespace = "waybar" },
	blur = true,
})

hl.layer_rule({
	name = "fuzzel-blur",
	match = { namespace = "fuzzel" },
	blur = true,
})

-- Example stuff
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

require("hyprland.variables")
---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local altMod = "SUPER + SHIFT"

-- Custom binds
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open a browser window." })
hl.bind(altMod .. " + B", hl.dsp.exec_cmd(browser_private), { description = "Open a private browser window." })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher), { description = "Open the app launcher." })
hl.bind(
	altMod .. " + S",
	hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'),
	{ description = "Take a screenshot (rectangular selection)." }
)

-- Nvim
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. " -e " .. editor), { description = "Open editor." })
local work = terminal .. " -e " .. editor .. ' ~/Code/Work/fsl_libs/ -c "cd ~/Code/Work/fsl_libs/"'
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(work), { description = "Open editor in work repo." })

-- Discord Mute+Deafen
hl.bind("CTRL + SHIFT + M", hl.dsp.pass({ window = "class:(vesktop)" }), { description = "Toggle Mute on Vesktop." })
hl.bind("CTRL + SHIFT + D", hl.dsp.pass({ window = "class:(vesktop)" }), { description = "Toggle Deafen on Vesktop." })

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open a new terminal window." })

local closeWindowBind =
	hl.bind(mainMod .. " + C", hl.dsp.window.close(), { description = "Force-close the focused window." })
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd(
		"command -v hyprshutdown --vt 2 >/dev/null 2>&1 && hyprshutdown --vt 2|| hyprctl dispatch 'hl.dsp.exit()'"
	)
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open a new file explorer window" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle a window floating" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu), { description = "Launch Hyprlauncher" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Pseudotiles the focused window" })
hl.bind(
	mainMod .. " + J",
	hl.dsp.layout("togglesplit"),
	{ description = "Toggle which direction (NS/EW) the current workspace is tiled" }
) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Move the window focused left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move the window focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Move the window focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Move the window focus down" })

-- Move window with altMod + arrow keys
hl.bind(
	altMod .. " + left",
	hl.dsp.window.move({ direction = "left" }),
	{ description = "Move the focused window left" }
)
hl.bind(
	altMod .. " + right",
	hl.dsp.window.move({ direction = "right" }),
	{ description = "Move the focused window right" }
)
hl.bind(altMod .. " + up", hl.dsp.window.move({ direction = "up" }), { description = "Move the focused window up" })
hl.bind(
	altMod .. " + down",
	hl.dsp.window.move({ direction = "down" }),
	{ description = "Move the focused window down" }
)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

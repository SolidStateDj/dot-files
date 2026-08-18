require("hyprland.variables")
-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("waybar & hyprpaper & hypridle & arrpc")
	hl.exec_cmd("sleep 1 && ~/.config/hypr/random_wallpaper")
	hl.exec_cmd("steam -silent", { workspace = "10 silent" })
	hl.exec_cmd("vesktop", { workspace = "2 silent" })
	hl.exec_cmd("thunderbird", { workspace = "9 silent" })
	hl.exec_cmd(browser, { workspace = "1 silent" })
end)

-- Monitor 1
hl.workspace_rule({ workspace = "1", monitor = monitor_1, persistent = true, default = true })
hl.workspace_rule({ workspace = "3", monitor = monitor_1, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = monitor_1, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = monitor_1, persistent = true })
hl.workspace_rule({
	workspace = "9",
	monitor = monitor_1,
	persistent = true,
	on_created_empty = 'hl.dsp.exec_cmd("thunderbird", { silent = true })',
})

-- Monitor 2
hl.workspace_rule({
	workspace = "2",
	monitor = monitor_2,
	persistent = true,
	default = true,
	-- on_created_empty = hl.dsp.exec_cmd("vesktop", { silent = true }),
})
hl.workspace_rule({ workspace = "4", monitor = monitor_2, persistent = true })
hl.workspace_rule({ workspace = "6", monitor = monitor_2, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = monitor_2, persistent = true })
hl.workspace_rule({
	workspace = "10",
	monitor = monitor_2,
	persistent = true,
	on_created_empty = 'hl.dsp.exec_cmd("steam", { silent = true })',
})

hl.on("monitor.added", function(monitor)
	if monitor == monitor_1 then
		hl.dsp.workspace.move({ 1, monitor_1 })
		hl.dsp.workspace.move({ 3, monitor_1 })
		hl.dsp.workspace.move({ 5, monitor_1 })
		hl.dsp.workspace.move({ 7, monitor_1 })
		hl.dsp.workspace.move({ 9, monitor_1 })
	elseif monitor == monitor_2 then
		hl.dsp.workspace.move({ 2, monitor_2 })
		hl.dsp.workspace.move({ 4, monitor_2 })
		hl.dsp.workspace.move({ 6, monitor_2 })
		hl.dsp.workspace.move({ 8, monitor_2 })
		hl.dsp.workspace.move({ 10, monitor_2 })
	end
end)

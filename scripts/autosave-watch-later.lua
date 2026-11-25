local mp = require("mp")

local interval = 10

local timer = nil

local function save()
	mp.command("write-watch-later-config")
end

local function start_periodic_save()
	if timer then
		timer:kill()
	end
	timer = mp.add_periodic_timer(interval, save)
end

mp.register_event("file-loaded", start_periodic_save)
mp.register_event("end-file", save)
mp.register_event("shutdown", save)
